import 'package:todo_app/views/Password/changePassword.dart';
import 'package:todo_app/views/Password/forgotPassword.dart';
import 'package:todo_app/views/Password/resetPassword.dart';
import 'package:todo_app/views/Password/verification.dart';
import 'package:todo_app/views/logIn/logIn.dart';
import 'package:todo_app/views/logUp/signUp.dart';
import 'package:todo_app/views/screenS/mainPage.dart';
import 'package:todo_app/views/screenS/profile.dart';
import 'package:todo_app/views/screenS/profileUpdate.dart';
import 'package:todo_app/views/screenS/profileUserManagement.dart';
import 'package:todo_app/views/screenS/settings.dart';
import 'package:todo_app/views/splashScreen/splashScreen.dart';

class Routes{
    String splashScreen = Splashscreen().routeName;
    String changePassword = Changepassword().routeName;
    String forgotPassword = Forgotpassword().routeName;
    String resetPassword = Resetpassword().routeName;
    String verification = Verification().routeName;
    String logIn = Login().routeName;
    String signUp = Signup().routeName;
    String mainPage=Mainpage().routeName;
    String profile=Profile().routeName;
    String profileUpdate=UpdateProfileScreen().routeName;
    String profileUserManagement=Profileusermanagement().routeName;
    String settings=Settings().routeName;

}