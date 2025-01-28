import 'package:Accountings/views/Password/changePassword.dart';
import 'package:Accountings/views/Password/forgotPassword.dart';
import 'package:Accountings/views/Password/resetPassword.dart';
import 'package:Accountings/views/Password/verification.dart';
import 'package:Accountings/views/logIn/logIn.dart';
import 'package:Accountings/views/logUp/signUp.dart';
import 'package:Accountings/views/screenS/formDetailsFillUp.dart';
import 'package:Accountings/views/screenS/formFillUp.dart';
import 'package:Accountings/views/screenS/mainPage.dart';
import 'package:Accountings/views/screenS/notifications.dart';
import 'package:Accountings/views/screenS/profile.dart';
import 'package:Accountings/views/screenS/settings.dart';
import 'package:Accountings/views/splashScreen/splashScreen.dart';

class Routes{
    String splashScreen = Splashscreen().routeName;
    String changePassword = Changepassword().routeName;
    String forgotPassword = Forgotpassword().routeName;
    String resetPassword = Resetpassword().routeName;
    String verification = Verification().routeName;
    String logIn = Login().routeName;
    String signUp = Signup().routeName;
    String formFillUp= Formfillup().routeName;
    String formDetailsFillUp= Formdetailsfillup().routeName;
    String mainPage=Mainpage().routeName;
    String notifications=Notifications().routeName;
    String profile=Profile().routeName;
    String settings=Settings().routeName;

}