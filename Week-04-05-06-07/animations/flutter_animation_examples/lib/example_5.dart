import 'package:flutter/material.dart';

const defaultWidth = 100.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isZoomed = false;
  var _buttonText = "ZoomIn";
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 370),
              curve: _curve,
              width: _width,
              child: Image.asset("assets/space.jpg"),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    _isZoomed = !_isZoomed;
                    _buttonText = _isZoomed ? "ZoomOut" : "ZoomIn";
                    _width = _isZoomed
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;

                    _curve = _isZoomed ? Curves.bounceInOut : Curves.bounceOut;
                  });
                },
                child: Text(_buttonText))
          ],
        ),
      ),
    );
  }
}
