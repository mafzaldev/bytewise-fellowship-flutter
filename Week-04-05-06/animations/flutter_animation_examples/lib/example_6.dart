import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper();

  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

getRandomColor() => Color(0xFF000000 + math.Random().nextInt(0x00FFFFFF));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(begin: getRandomColor(), end: _color),
            duration: const Duration(seconds: 1),
            onEnd: () {
              setState(() {
                _color = getRandomColor();
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              color: Colors.red,
            ),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                  colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
                  child: child);
            },
          ),
        ),
      ),
    );
  }
}
