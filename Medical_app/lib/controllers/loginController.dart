import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_app/controllers/authenticationRepository.dart';

class Logincontroller extends GetxController {
  static Logincontroller get instance => Get.find();

  
  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

    void checkUser( String email, String password,) {
    Authenticationrepository.instance
        .loginWithEmailAndPassword(email, password);
  }
}
