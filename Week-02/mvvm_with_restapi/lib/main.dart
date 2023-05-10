import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mvvm_with_restapi/view_model/auth_view_model.dart';
import 'package:mvvm_with_restapi/view_model/user_view_model.dart';
import 'package:mvvm_with_restapi/res/app_colors.dart';
import 'package:mvvm_with_restapi/utils/routes/routes.dart';
import 'package:mvvm_with_restapi/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
          theme: ThemeData(primarySwatch: AppColors.primaryMaterialColor),
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.home,
          onGenerateRoute: Routes.generateRoute),
    );
  }
}
