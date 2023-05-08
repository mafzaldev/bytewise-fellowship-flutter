import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallbackShortcutsExample extends StatefulWidget {
  const CallbackShortcutsExample({super.key});

  @override
  State<CallbackShortcutsExample> createState() =>
      _CallbackShortcutsExampleState();
}

class _CallbackShortcutsExampleState extends State<CallbackShortcutsExample> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: <ShortcutActivator, VoidCallback>{
        const SingleActivator(LogicalKeyboardKey.arrowUp): () {
          setState(() => count = count + 1);
        },
        const SingleActivator(LogicalKeyboardKey.arrowDown): () {
          setState(() => count = count - 1);
        },
      },
      child: Focus(
        autofocus: true,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press the up arrow key to add to the counter'),
              const Text(
                  'Press the down arrow key to subtract from the counter'),
              Text('count: $count'),
            ],
          ),
        ),
      ),
    );
  }
}
