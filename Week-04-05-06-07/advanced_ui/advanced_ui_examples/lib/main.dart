import 'package:advanced_ui_examples/focus_traversal_widget_example.dart';
import 'package:advanced_ui_examples/focus_widget_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced UI Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Advanced UI Examples')),
        body: const OrderedButtonRow(),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: const <Widget>[MyCustomWidget(), MyCustomWidget()],
        // ),
      ),
    );
  }
}
