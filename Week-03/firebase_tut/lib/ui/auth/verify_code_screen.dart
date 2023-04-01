import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/posts/posts_screen.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:firebase_tut/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController vCodeController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: vCodeController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: '000 000',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter 6 digit code';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            RoundedButton(
                title: "Verify",
                isLoading: isLoading,
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final credentials = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: vCodeController.text.toString());
                  try {
                    auth.signInWithCredential(credentials).then((value) {
                      if (value.user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostsScreen(),
                          ),
                        );
                      }
                    });
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    Utils().showSnackBar(context, Colors.red, e.toString());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
