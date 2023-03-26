import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  int x = 0;
  @override
  Widget build(BuildContext context) {
    log("build");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Provider Tutorials"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  x.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x++;
            log(x.toString());
          },
          child: const Icon(Icons.add),
        ));
  }
}
