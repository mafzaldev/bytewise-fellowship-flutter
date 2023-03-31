import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/verify_code.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:firebase_tut/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with phone'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '+92 300 1234567',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            RoundedButton(
              title: "Login with phone",
              isLoading: isLoading,
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text.toString(),
                    verificationCompleted: (_) {
                      setState(() {
                        isLoading = false;
                      });
                    },
                    verificationFailed: (e) {
                      Utils().showSnackBar(context, Colors.red, e.toString());
                      setState(() {
                        isLoading = false;
                      });
                    },
                    codeSent: (String verificationId, int? token) {
                      log(token.toString());
                      log(verificationId.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyCodeScreen(
                                  verificationId: verificationId)));
                      setState(() {
                        isLoading = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      Utils().showSnackBar(context, Colors.red, e.toString());
                      setState(() {
                        isLoading = false;
                      });
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
