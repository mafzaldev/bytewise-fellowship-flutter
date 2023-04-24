import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  int _count = 50;

  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
