import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/favourite_provider.dart';
import 'package:provider_tutorials/screens/favourite/my_favourites.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    log("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen'),
        actions: [
          InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavourites())),
              child: const Icon(Icons.favorite)),
          const SizedBox(width: 10)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProvider>(
                      builder: ((context, value, child) {
                    return ListTile(
                        onTap: () {
                          value.toggleItem(index);
                        },
                        title: Text('Item $index'),
                        trailing: Icon(
                          value.getSelectedItems.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.redAccent,
                        ));
                  }));
                }),
          )
        ],
      ),
    );
  }
}
