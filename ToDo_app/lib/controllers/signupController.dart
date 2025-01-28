import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';
import 'package:todo_app/controllers/userRepository.dart';
import 'package:todo_app/models/userModel.dart';
import 'package:todo_app/views/screenS/mainPage.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final Userrepo = Get.put(Userrepository());

  // void registerUser( String email, String password,String fullname,String phoneNo) {
  void registerUser(
    String email,
    String password,
  ) {
    Authenticationrepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(Usermodel user) async {
    await Userrepo.createUser(user);
    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   // Routes().ciHome,
    //   Routes().mainPage,
    //   (route) => false,
    // );
    Get.to(() =>  Mainpage());
  }
}
