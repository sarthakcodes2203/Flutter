import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();

  final phoneNo = TextEditingController();


  void phoneAuthentication(String phoneNo) {
    Authenticationrepository.instance.phoneAuthentication(phoneNo);
  }
}
