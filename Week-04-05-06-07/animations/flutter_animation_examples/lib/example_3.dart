import 'dart:math' show pi;
import 'package:flutter/material.dart';

const widthAndHeight = 100.0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
        body: SafeArea(
      child: Center(
          child: AnimatedBuilder(
        animation: Listenable.merge([_xController, _yController, _zController]),
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(_animation.evaluate(_xController))
              ..rotateY(_animation.evaluate(_yController))
              ..rotateZ(_animation.evaluate(_zController)),
            child: Stack(
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(0, 0, -widthAndHeight),
                  child: Container(
                    color: Colors.purple,
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()..rotateY(pi / 2),
                  child: Container(
                    color: Colors.red,
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()..rotateY(-pi / 2),
                  child: Container(
                    color: Colors.yellow,
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                Container(
                  color: Colors.green,
                  width: widthAndHeight,
                  height: widthAndHeight,
                ),
                Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.identity()..rotateX(-pi / 2),
                  child: Container(
                    color: Colors.orange,
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
                Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()..rotateX(pi / 2),
                  child: Container(
                    color: Colors.brown,
                    width: widthAndHeight,
                    height: widthAndHeight,
                  ),
                ),
              ],
            ),
          );
        },
      )),
    ));
  }
}
