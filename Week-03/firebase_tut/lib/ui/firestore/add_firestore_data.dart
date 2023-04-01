import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:firebase_tut/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class AddFirestoreDataScreen extends StatefulWidget {
  const AddFirestoreDataScreen({super.key});

  @override
  State<AddFirestoreDataScreen> createState() => _AddFirestoreDataScreenState();
}

class _AddFirestoreDataScreenState extends State<AddFirestoreDataScreen> {
  bool isLoading = false;
  TextEditingController postTextController = TextEditingController();
  final fireStoreRef = FirebaseFirestore.instance.collection("posts");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Firestore Post'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
                controller: postTextController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: 'Whats on your mind?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                )),
            const SizedBox(height: 20),
            RoundedButton(
                title: "Add",
                isLoading: isLoading,
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  String id = DateTime.now().microsecondsSinceEpoch.toString();
                  fireStoreRef.doc(id).set({
                    "id": id,
                    "postText": postTextController.text.toString(),
                  }).then((value) {
                    Utils().showSnackBar(context, Colors.black, "Post Added");
                    setState(() {
                      isLoading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().showSnackBar(context, Colors.red, error.toString());

                    setState(() {
                      isLoading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
