import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static flushBarMessage(BuildContext context, String message,
      {Color color = Colors.red,
      Icon icon = const Icon(Icons.error, color: Colors.white)}) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor: color,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(20),
          icon: icon,
          positionOffset: 10,
          duration: const Duration(seconds: 3),
        )..show(context));
  }
}
