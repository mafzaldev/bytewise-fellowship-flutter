import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_with_restapi/res/components/rounded_button.dart';
import 'package:mvvm_with_restapi/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obsecurePassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("LoginView")),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Email',
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email_outlined)),
                onFieldSubmitted: (value) => Utils.fieldFocusChange(
                    context, _emailFocusNode, _passwordFocusNode),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: ((context, value, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: 'Password',
                        label: const Text('Password'),
                        prefixIcon: const Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(_obsecurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                        ),
                      ),
                    );
                  })),
              const SizedBox(height: 20),
              RoundedButton(
                  title: "Login",
                  onTap: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage(context, "Email is required");
                      return;
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          context, "Password is required");
                      return;
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          context, "Password must be at least 6 characters");
                      return;
                    } else if (!_emailController.text.contains("@")) {
                      Utils.flushBarErrorMessage(context, "Email is invalid");
                      return;
                    } else {
                      log("API HIT");
                      return;
                    }
                  }),
            ]),
      ),
    );
  }
}
