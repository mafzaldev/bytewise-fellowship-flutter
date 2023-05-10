import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", user.token.toString());
    log(user.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    log(token.toString());
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("token");
    return true;
  }
}
