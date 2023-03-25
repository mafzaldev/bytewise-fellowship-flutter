import 'package:covid_tracker/widgets/resusable_row.dart';
import 'package:flutter/material.dart';
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

  // final colorList = <Color>[
  //   Color(OxFF4285F4),
  //   Color(Oxfflaa260),
  //   Color(Oxffde5246),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          PieChart(
            dataMap: const {
              "Total": 20,
              "Recovered": 15,
              "Deaths": 5,
            },
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            legendOptions: const LegendOptions(
              legendPosition: LegendPosition.left,
            ),
            animationDuration: const Duration(milliseconds: 1200),
            chartType: ChartType.ring,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: Card(
              child: Column(
                children: [
                  ReusableRow(
                    title: 'Total Cases',
                    value: '20',
                  ),
                  ReusableRow(
                    title: 'Total Cases',
                    value: '20',
                  ),
                  ReusableRow(
                    title: 'Total Cases',
                    value: '20',
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff1aa260),
              ),
              child: const Center(
                child: Text('Track Countries'),
              ))
        ]),
      ),
    ));
  }
}
