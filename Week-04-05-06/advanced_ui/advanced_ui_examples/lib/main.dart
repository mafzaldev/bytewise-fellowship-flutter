import 'package:flutter/material.dart';
import 'package:advanced_ui_examples/actions_shortcuts_example.dart';

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
        body: const ActionShortcutsExample(),
      ),
    );
  }
}
