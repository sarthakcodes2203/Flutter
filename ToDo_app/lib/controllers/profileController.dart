import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';
import 'package:todo_app/controllers/userRepository.dart';
import 'package:todo_app/models/userModel.dart';

class Profilecontroller extends GetxController {
  static Profilecontroller get instance => Get.find();

  final _authRepo = Get.put(Authenticationrepository());
  final _userRepo = Get.put(Userrepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<Usermodel>> getAllUser() async {
    return await _userRepo.getAllUser();  
  }
}
