import 'dart:developer';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_tut/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:firebase_tut/widgets/rounded_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref("images");

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        log('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Upload Image Screen'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen())));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: getImage,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.black,
                    width: 1,
                  )),
                  child: Center(
                      child: _image == null
                          ? const Text('No image selected.')
                          : Image.file(_image!)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                  title: "Upload Image",
                  onTap: () async {
                    String id =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    firebase_storage.Reference ref = storage.ref("/images$id");
                    firebase_storage.UploadTask uploadTask =
                        ref.putFile(_image!);
                    await Future.value(uploadTask);
                    var imageURL = await ref.getDownloadURL();

                    databaseRef
                        .child(id)
                        .set({
                          "id": id,
                          "postText": imageURL.toString(),
                        })
                        .then((value) => {
                              Utils().showSnackBar(
                                  context, Colors.black, "Image Added to DB"),
                            })
                        .onError((error, stackTrace) => {
                              Utils().showSnackBar(
                                  context, Colors.red, error.toString()),
                            });
                  })
            ],
          ),
        ));
  }
}
