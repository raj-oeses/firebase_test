import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
Future<void> showToast(String message, {bool isValid = true}) async {
  try {
    await Fluttertoast.cancel();

    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: isValid ? Colors.green : Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}
