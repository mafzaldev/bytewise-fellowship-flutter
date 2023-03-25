import 'package:covid_tracker/Widgets/resusable_row.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  String name, flag;
  int cases, deaths, recovered, active, critical, population;
  CountryDetails({
    Key? key,
    required this.name,
    required this.flag,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.critical,
    required this.population,
  }) : super(key: key);

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .070),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        ReusableRow(
                            title: "Cases", value: widget.cases.toString()),
                        ReusableRow(
                            title: "Deaths", value: widget.deaths.toString()),
                        ReusableRow(
                            title: "Recovered",
                            value: widget.recovered.toString()),
                        ReusableRow(
                            title: "Active", value: widget.active.toString()),
                        ReusableRow(
                            title: "Critical",
                            value: widget.critical.toString()),
                        ReusableRow(
                            title: "Population",
                            value: widget.population.toString())
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.flag),
                ),
              ],
            )
          ]),
    );
  }
}
