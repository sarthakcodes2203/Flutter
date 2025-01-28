import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/models/userModel.dart';

class Userrepository extends GetxController {
  static Userrepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(Usermodel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              "Success",
              "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              duration: Duration(seconds: 3),
            ))
        .catchError((error, stacktree) {
      Get.snackbar(
        "Failed",
        "Something went wrong.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    });
  }

  Future<Usermodel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<Usermodel>> getAllUser( ) async {
    final snapshot =
        await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).toList();
    return userData;
  }
}
