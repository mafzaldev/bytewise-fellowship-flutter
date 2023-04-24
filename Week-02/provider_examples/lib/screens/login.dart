import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    authProvider.login(
                        emailController.text, passwordController.text);
                  },
                  child: authProvider.loading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                ),
              ),
            ],
          ),
        ));
  }
}
