import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoginScreen")),
      body: Center(
          child: TextButton(
        onPressed: () => Utils.flushBarErrorMessage(context, "Login"),
        child: const Text("Login"),
      )),
    );
  }
}
