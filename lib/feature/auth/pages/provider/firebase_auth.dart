import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../core/api/api_services.dart';
import '../../data/model/register_model.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  //this stream will be listining to firebase auth chagne
  //depending on that it will APP_WIDGET will redirect the user
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  //this is instance for firebase
  var db = FirebaseFirestore.instance;

  Future<void> signIn({required String email, required String password}) async {
    ApiServices().loadingPg();
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => print('value is ${value.user.toString()}'));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message ?? '',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT);
    }
    Get.back();
  }

  Future<void> signUp({required RegisterModel data}) async {
    ApiServices().loadingPg();
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: data.email ?? '', password: data.password ?? '')
          .then((value) async {
        if (value.user?.uid != null) {
          data.uId = value.user?.uid;
          data.isAnonymous = value.user?.isAnonymous;
          data.isEmailVerified = value.user?.emailVerified;
          data.creationTime = value.user?.metadata.creationTime;
          data.lastSignInTime = value.user?.metadata.lastSignInTime;
          data.phoneNumber = value.user?.phoneNumber;
          await createUser(data: data);
        }
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? '',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    Get.back();
  }

  Future<void> signOut() async => await _firebaseAuth.signOut();

  //This method is used to create the user in firestore
  //Creates the user doc named whatever the user uid is in te collection "Users"
  //and adds the user data
  Future<void> createUser({required RegisterModel data}) async => await db
      .collection("users")
      .add(data.toJson()).whenComplete(() => Get.back());
}
