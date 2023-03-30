import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({super.key});

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    log("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.getSelectedItems.length,
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
