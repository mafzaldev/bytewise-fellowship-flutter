import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:firebase_tut/ui/upload_image.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UploadImageScreen())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen())));
    }
  }
}
