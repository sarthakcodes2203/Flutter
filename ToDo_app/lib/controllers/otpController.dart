import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';
import 'package:todo_app/views/screenS/mainPage.dart';

class OTPcontroller extends GetxController {
  static OTPcontroller get instance => Get.find();

  Future<void> verifyOTP(String otp) async {
    var isveried = await Authenticationrepository.instance.verifyOTP(otp);

    isveried ? Get.offAll(Mainpage()) : Get.back();
  }
}
