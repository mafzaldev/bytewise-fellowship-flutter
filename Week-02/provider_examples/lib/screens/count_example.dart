import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    log("build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Example with Provider'),
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
        log("build Consumer");

        return Text(
          value.count.toString(),
          style: const TextStyle(fontSize: 30),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
