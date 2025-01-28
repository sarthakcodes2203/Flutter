import 'package:my_app/views/admin/adminPage.dart';
import 'package:my_app/views/article/articleScreen.dart';
import 'package:my_app/views/cartScreen/cart.dart';
import 'package:my_app/views/cartScreen/paymentDone.dart';
import 'package:my_app/views/doctor/appointment.dart';
import 'package:my_app/views/doctor/appointmentDone.dart';
import 'package:my_app/views/doctor/doctorDetails.dart';
import 'package:my_app/views/doctor/findDoctorsScreen.dart';
import 'package:my_app/views/doctor/schedule.dart';
import 'package:my_app/views/doctor/topDoctorScreen.dart';
import 'package:my_app/views/forgotPasswordScreen/forgotPassword.dart';
import 'package:my_app/views/forgotPasswordScreen/newPasswordCreatedScreen.dart';
import 'package:my_app/views/forgotPasswordScreen/newPasswordScreen.dart';
import 'package:my_app/views/forgotPasswordScreen/otpScreen.dart';
import 'package:my_app/views/homeScreen/home.dart';
import 'package:my_app/views/homeScreen/mainScreen.dart';
import 'package:my_app/views/loginScreen/logInScreen.dart';
import 'package:my_app/views/loginScreen/logedInScreen.dart';
import 'package:my_app/views/pharmacy/drugDetail.dart';
import 'package:my_app/views/pharmacy/pharmacy.dart';
import 'package:my_app/views/profileScreen/loggedOut.dart';
import 'package:my_app/views/profileScreen/profileScreen.dart';
import 'package:my_app/views/signUpScreen/signUp.dart';
import 'package:my_app/views/signUpScreen/signedUp.dart';
import 'package:my_app/views/splashScreen/secondSplashScreen.dart';
import 'package:my_app/views/splashScreen/splashScreen.dart';

class Routes {
  //#region *** common pages pages ***
  String splashScreen = Splashscreen().routeName;
  String secondSplashScreen = Secondsplashscreen().routeName;
  String signUp = SignUp().routeName;
  String signedUp = Signedup().routeName;
  String logIn = signIn().routeName;
  String loggedIn = signedIn().routeName;
  String homeScreen = Homescreen().routeName;
  String article = Article().routeName;
  String cart = Cart().routeName;
  String paymentDone = Paymentdone().routeName;
  String appointment = Appointment(doctor: {},).routeName;
  String appointmentDone = Appointmentdone().routeName;
  String doctorDetails = Doctordetails(doctor: {},).routeName;
  String findDoctorsScreen = Finddoctorsscreen().routeName;
  String schedule = Schedule().routeName;
  String topDoctorsScreen = Topdoctorscreen().routeName;
  String forgotPassword = Forgotpassword().routeName;
  String otpScreen = Otpscreen().routeName;
  String newPasswordScreen = Newpasswordscreen().routeName;
  String newPasswordCreatedScreen = Newpasswordcreatedscreen().routeName;
  // String drugDetail = Drugdetail().routeName;
  String pharmacy = Pharmacy().routeName;
  String profileScreen = Profilescreen().routeName;
  String loggedOut = Loggedout().routeName;
  String mainScreen = Mainscreen().routeName;
  String adminOptions = Adminpage().routeName;


}

