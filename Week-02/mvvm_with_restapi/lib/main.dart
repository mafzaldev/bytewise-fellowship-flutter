import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/res/colors.dart';
import 'package:mvvm_with_restapi/utils/routes/routes.dart';
import 'package:mvvm_with_restapi/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: AppColors.primaryMaterialColor),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute);
  }
}
