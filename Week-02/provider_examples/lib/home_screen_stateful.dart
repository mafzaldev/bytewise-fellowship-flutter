import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreenStateful extends StatefulWidget {
  const HomeScreenStateful({super.key});

  @override
  State<HomeScreenStateful> createState() => _HomeScreenStatefulState();
}

class _HomeScreenStatefulState extends State<HomeScreenStateful> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Widget'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text(
                  count.toString(),
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
