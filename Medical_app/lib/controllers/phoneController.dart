import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_app/controllers/authenticationRepository.dart';

class Phonecontroller extends GetxController {
  static Phonecontroller get instance => Get.find();

  void phoneAuthentication(String phoneNo) {
    Authenticationrepository.instance.phoneAuthentication(phoneNo);
  }
}
