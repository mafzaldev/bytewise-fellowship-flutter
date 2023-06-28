// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int x = 0;
  HomeScreen({super.key});

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
