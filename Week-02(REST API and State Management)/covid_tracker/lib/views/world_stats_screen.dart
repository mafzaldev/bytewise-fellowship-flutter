import 'package:covid_tracker/Models/world_stats_model.dart';
import 'package:covid_tracker/Services/stats_services.dart';
import 'package:covid_tracker/Views/countries_list_screen.dart';
import 'package:covid_tracker/widgets/resusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          FutureBuilder(
              future: statsServices.fetchWorldStats(),
              builder: (context, AsyncSnapshot<WorldStatsModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        size: 50,
                        color: Colors.white,
                        controller: controller,
                      ));
                } else {
                  return Expanded(
                    flex: 1,
                    child: Column(children: [
                      PieChart(
                        dataMap: {
                          "Total":
                              double.parse(snapshot.data!.cases!.toString()),
                          "Recovered": double.parse(
                              snapshot.data!.recovered!.toString()),
                          "Deaths":
                              double.parse(snapshot.data!.deaths!.toString()),
                        },
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        animationDuration: const Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.05),
                        child: Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                title: 'Total',
                                value: snapshot.data!.cases!.toString(),
                              ),
                              ReusableRow(
                                title: 'Deaths',
                                value: snapshot.data!.cases!.toString(),
                              ),
                              ReusableRow(
                                title: 'Recovered',
                                value: snapshot.data!.recovered!.toString(),
                              ),
                              ReusableRow(
                                title: 'Active',
                                value: snapshot.data!.active!.toString(),
                              ),
                              ReusableRow(
                                title: 'Critical',
                                value: snapshot.data!.critical!.toString(),
                              ),
                              ReusableRow(
                                title: 'Today Deaths',
                                value: snapshot.data!.todayDeaths!.toString(),
                              ),
                              ReusableRow(
                                title: 'Today Recovered',
                                value:
                                    snapshot.data!.todayRecovered!.toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CountriesList())),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff1aa260),
                            ),
                            child: const Center(
                              child: Text('Track Countries'),
                            )),
                      )
                    ]),
                  );
                }
              }),
        ]),
      ),
    ));
  }
}
