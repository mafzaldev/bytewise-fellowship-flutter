import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:firebase_tut/ui/firestore/add_firestore_data.dart';
import 'package:flutter/material.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController editPostController = TextEditingController();
  final fireStoreRef =
      FirebaseFirestore.instance.collection("posts").snapshots();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("posts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Firestore Posts Screen'),
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          StreamBuilder<QuerySnapshot>(
              stream: fireStoreRef,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data!.docs[index]["postText"]
                                .toString()),
                            trailing: PopupMenuButton(
                              icon: const Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pop(context);
                                        showMyDialog(
                                            snapshot.data!.docs[index]["id"]
                                                .toString(),
                                            snapshot
                                                .data!.docs[index]["postText"]
                                                .toString());
                                      },
                                      leading: const Icon(Icons.edit),
                                      title: const Text("Update"),
                                    )),
                                PopupMenuItem(
                                    value: 1,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pop(context);
                                        collectionReference
                                            .doc(snapshot
                                                .data!.docs[index]["id"]
                                                .toString())
                                            .delete()
                                            .then((value) => log("Deleted"));
                                      },
                                      leading: const Icon(Icons.delete),
                                      title: const Text("Delete"),
                                    )),
                              ],
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddFirestoreDataScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String id, String postText) async {
    editPostController.text = postText;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update'),
          content: Container(
            child: TextField(
                controller: editPostController,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                )),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  collectionReference
                      .doc(id)
                      .update({
                        "postText": editPostController.text,
                      })
                      .then((value) => log("Post Updated"))
                      .onError((error, stackTrace) => log("Error: $error"));
                },
                child: const Text('Update'))
          ],
        );
      },
    );
  }
}
