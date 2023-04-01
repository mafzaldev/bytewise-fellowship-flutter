import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_tut/ui/auth/login_screen.dart';
import 'package:firebase_tut/ui/posts/add_post_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref("posts");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Screen'),
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
          Expanded(
              child: StreamBuilder(
                  stream: databaseRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      Map<dynamic, dynamic> values =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = values.values.toList();
                      return ListView.builder(
                          itemCount: snapshot.data!.snapshot.children.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(list[index]["postText"].toString()),
                            );
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })),
          Expanded(
            child: FirebaseAnimatedList(
                query: databaseRef,
                itemBuilder: ((context, snapshot, animation, index) {
                  return ListTile(
                    title: Text(snapshot.child("postText").value.toString()),
                  );
                })),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
