import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../widget/internet_disconnect_dialogue.dart';

class ApiServices {
  /// Method to start listening connectivity change status
  ///
  void startListeningConnectivityChange() =>
      Connectivity().onConnectivityChanged.listen(_listenStatusChange);

  /// Connected Status
  ///
  bool _connected = true;

  /// Method to listen connectivity change
  ///
  ///
  loadingPg() async {
    if (!_connected) {
      showToast("No Internet 🚫📵", forConnected: false);
      throw Exception('No Internet 🚫📵');
    }
    Get.dialog(const LoadingDialog());
  }

  void _listenStatusChange(ConnectivityResult result) {
    final connected = result != ConnectivityResult.none;

    if (connected == _connected) return;
    _connected = connected;

    switch (result) {
      case ConnectivityResult.mobile:
        showToast('Internet Connected 📶');
        break;
      case ConnectivityResult.wifi:
        showToast('Internet Connected ᯤ');
        break;
      case ConnectivityResult.ethernet:
        showToast('Internet Connected ➰');
        break;
      case ConnectivityResult.vpn:
        showToast('Internet Connected 🛡️');
      case ConnectivityResult.bluetooth:
        showToast('Internet Connected ᛒ');
      case ConnectivityResult.other:
        showToast('Internet Connected 🌐');
        break;
      case ConnectivityResult.none:
        InternetDisconnectedDialog.show();
        showToast('Internet Disconnected 🛡️', forConnected: false); //
        break;
      default:
        InternetDisconnectedDialog.show();
        showToast('Internet Disconnected ❗️️', forConnected: false);
        break;
    }
  }

  /// Method to show toast
  ///
  Future<void> showToast(String message, {bool forConnected = true}) async {
    try {
      await Fluttertoast.cancel();
      await Fluttertoast.showToast(
          msg: message,
          backgroundColor: forConnected ? Colors.green : Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class LoadingDialog extends Dialog {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }
}
