import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  double _value = 1.0;

  double get value => _value;

  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
