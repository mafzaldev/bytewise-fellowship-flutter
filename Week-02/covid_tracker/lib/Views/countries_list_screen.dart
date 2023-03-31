import 'package:covid_tracker/Services/stats_services.dart';
import 'package:covid_tracker/Views/country_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) => setState(() {}),
              decoration: const InputDecoration(
                hintText: 'Search with country name',
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
            future: statsServices.fetchCountriesList(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.grey.shade100,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              color: Colors.white,
                            ),
                            title: Container(
                              height: 10,
                              width: 90,
                              color: Colors.white,
                            ),
                            subtitle: Container(
                              height: 10,
                              width: 90,
                              color: Colors.white,
                            ),
                          );
                        }));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapshot.data![index]["country"];
                      if (searchController.text.isEmpty) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryDetails(
                                          name: snapshot.data![index]
                                              ["country"],
                                          flag: snapshot.data![index]
                                              ["countryInfo"]["flag"],
                                          cases: snapshot.data![index]["cases"],
                                          deaths: snapshot.data![index]
                                              ["deaths"],
                                          recovered: snapshot.data![index]
                                              ["recovered"],
                                          active: snapshot.data![index]
                                              ["active"],
                                          critical: snapshot.data![index]
                                              ["critical"],
                                          population: snapshot.data![index]
                                              ["population"],
                                        )));
                          },
                          child: ListTile(
                            leading: Image(
                              height: 40,
                              width: 40,
                              image: NetworkImage(
                                  snapshot.data![index]["countryInfo"]["flag"]),
                            ),
                            title: Text(snapshot.data![index]["country"]),
                            subtitle:
                                Text(snapshot.data![index]["cases"].toString()),
                          ),
                        );
                      } else if (name
                          .toLowerCase()
                          .contains(searchController.text.toLowerCase())) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryDetails(
                                          name: snapshot.data![index]
                                              ["country"],
                                          flag: snapshot.data![index]
                                              ["countryInfo"]["flag"],
                                          cases: snapshot.data![index]["cases"],
                                          deaths: snapshot.data![index]
                                              ["deaths"],
                                          recovered: snapshot.data![index]
                                              ["recovered"],
                                          active: snapshot.data![index]
                                              ["active"],
                                          critical: snapshot.data![index]
                                              ["critical"],
                                          population: snapshot.data![index]
                                              ["population"],
                                        )));
                          },
                          child: ListTile(
                            leading: Image(
                              height: 40,
                              width: 40,
                              image: NetworkImage(
                                  snapshot.data![index]["countryInfo"]["flag"]),
                            ),
                            title: Text(snapshot.data![index]["country"]),
                            subtitle:
                                Text(snapshot.data![index]["cases"].toString()),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    });
              }
            },
          ))
        ],
      )),
    );
  }
}
