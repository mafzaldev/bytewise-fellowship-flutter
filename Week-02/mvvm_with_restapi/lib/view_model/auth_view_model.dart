import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/repository/auth_repository.dart';
import 'package:mvvm_with_restapi/utils/routes/routes_name.dart';
import 'package:mvvm_with_restapi/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> login(BuildContext context, dynamic data) async {
    setLoading(true);
    _authRepo.login(data).then((value) {
      setLoading(false);
      Utils.flushBarMessage(context, "Login Successfull",
          color: Colors.deepPurple,
          icon: const Icon(Icons.check, color: Colors.white));
      Navigator.pushNamed(context, RoutesName.home);
      log(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarMessage(context, error.toString());
      log(error.toString());
    });
  }

  Future<void> signup(BuildContext context, dynamic data) async {
    setLoading(true);
    _authRepo.signup(data).then((value) {
      setLoading(false);
      Utils.flushBarMessage(context, "Signup Successfull",
          color: Colors.deepPurple,
          icon: const Icon(Icons.check, color: Colors.white));
      Navigator.pushNamed(context, RoutesName.login);
      log(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarMessage(context, error.toString());
      log(error.toString());
    });
  }
}
