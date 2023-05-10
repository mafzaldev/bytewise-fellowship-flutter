import 'package:flutter/material.dart';

import 'package:mvvm_with_restapi/utils/routes/routes_name.dart';
import 'package:mvvm_with_restapi/view/home_view.dart';
import 'package:mvvm_with_restapi/view/login_view.dart';
import 'package:mvvm_with_restapi/view/signup_view.dart';
import 'package:mvvm_with_restapi/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for: ${settings.name}'),
            ),
          );
        });
    }
  }
}
