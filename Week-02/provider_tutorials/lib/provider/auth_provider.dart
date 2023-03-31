import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool loading = false;

  bool get isLoading => loading;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        log("Success: ${jsonDecode(response.body)["token"].toString()}");
      } else {
        log("Failed: ${jsonDecode(response.body)["error"].toString()}");
      }
    } catch (e) {
      log(e.toString());
    }
    setLoading(false);
  }
}
