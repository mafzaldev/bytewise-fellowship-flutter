import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/model/user_model.dart';
import 'package:mvvm_with_restapi/utils/routes/routes_name.dart';
import 'package:mvvm_with_restapi/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) {
      log(value.token.toString());
      if (value.token.toString() == "null" || value.token.toString() == "") {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }
}
