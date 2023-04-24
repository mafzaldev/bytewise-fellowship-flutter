import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:firebase_tut/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          RoundedButton(
              title: "Send Password Reset Email",
              isLoading: isLoading,
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                auth
                    .sendPasswordResetEmail(
                  email: emailController.text.toString(),
                )
                    .then((value) {
                  Utils().showSnackBar(context, Colors.black,
                      "Password reset instructions sent to your email address!");
                  setState(() {
                    isLoading = false;
                  });
                }).catchError((error, stackTrace) {
                  setState(() {
                    isLoading = false;
                  });
                  Utils().showSnackBar(
                    context,
                    Colors.red,
                    error.toString(),
                  );
                });
              }),
        ]),
      ),
    );
  }
}
