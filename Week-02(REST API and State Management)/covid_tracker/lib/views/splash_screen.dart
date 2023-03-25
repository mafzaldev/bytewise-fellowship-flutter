import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:covid_tracker/Views/world_stats_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WorldStatsScreen(),
                  ))
            });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: controller,
                builder: ((BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: controller.value * 0.8 * math.pi,
                    child: child,
                  );
                }),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: Image.asset('images/virus.png')),
                )),
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.center,
              child: Text("COVID-19\nTracker App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
