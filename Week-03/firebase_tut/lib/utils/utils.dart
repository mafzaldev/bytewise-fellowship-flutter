import 'package:flutter/material.dart';

class Utils {
  void showSnackBar(
      BuildContext context, Color backgroundColor, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
