import 'package:flutter/foundation.dart';

class FavouriteProvider extends ChangeNotifier {
  List<int> selectedItems = [];

  List<int> get getSelectedItems => selectedItems;

  void toggleItem(int value) {
    selectedItems.contains(value)
        ? selectedItems.remove(value)
        : selectedItems.add(value);
    notifyListeners();
  }
}
