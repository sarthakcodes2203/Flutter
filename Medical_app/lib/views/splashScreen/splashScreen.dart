import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/splashScreen/secondSplashScreen.dart';
import 'package:my_app/views/loginScreen/logInScreen.dart';
import 'package:my_app/views/loginScreen/logedInScreen.dart';
import 'package:my_app/views/signUpScreen/signUp.dart';
import 'package:my_app/views/signUpScreen/signedUp.dart';
import 'package:my_app/views/forgotPasswordScreen/forgotPassword.dart';
import 'package:my_app/views/forgotPasswordScreen/otpScreen.dart';
import 'package:my_app/views/forgotPasswordScreen/newPasswordScreen.dart';
import 'package:my_app/views/forgotPasswordScreen/newPasswordCreatedScreen.dart';
import 'package:my_app/views/homeScreen/home.dart';
import 'package:my_app/views/doctor/findDoctorsScreen.dart';
import 'package:my_app/views/doctor/topDoctorScreen.dart';
import 'package:my_app/views/doctor/doctorDetails.dart';
import 'package:my_app/views/doctor/appointment.dart';
import 'package:my_app/views/doctor/appointmentDone.dart';
import 'package:my_app/views/doctor/schedule.dart';
import 'package:my_app/views/pharmacy/pharmacy.dart';
import 'package:my_app/views/article/articleScreen.dart';
import 'package:my_app/views/pharmacy/drugDetail.dart';
import 'package:my_app/views/cartScreen/cart.dart';
import 'package:my_app/views/cartScreen/paymentDone.dart';
import 'package:my_app/views/profileScreen/profileScreen.dart';
import 'package:my_app/views/profileScreen/loggedOut.dart';

class Splashscreen extends StatefulWidget {
  String routeName="/splashScreen";

  Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(
        // context,
        // MaterialPageRoute(builder: (context) => const Secondsplashscreen()),
        // MaterialPageRoute(builder: (context) => const SignUp()),
        // MaterialPageRoute(builder: (context) => const Signedup()),
        // MaterialPageRoute(builder: (context) => const SignIn()),
        // MaterialPageRoute(builder: (context) => const SignedIn()),
        // MaterialPageRoute(builder: (context) => const Forgotpassword()),
        // MaterialPageRoute(builder: (context) => const Otpscreen()),
        // Apply validation for 1996 to next screen
        // MaterialPageRoute(builder: (context) => const Newpasswordscreen()),
        // MaterialPageRoute(builder: (context) => const Newpasswordcreatedscreen()),
        // MaterialPageRoute(builder: (context) => const Homescreen()),
        // MaterialPageRoute(builder: (context) => const Topdoctorscreen()),
        // MaterialPageRoute(builder: (context) => const Finddoctorsscreen()),
        // MaterialPageRoute(builder: (context) => const Doctordetails()),
        // MaterialPageRoute(builder: (context) => const Appointment()),
        // MaterialPageRoute(builder: (context) => const Appointmentdone()),
        // MaterialPageRoute(builder: (context) => const Schedule()),
        // 232, 243, 241
        // MaterialPageRoute(builder: (context) => const Drugdetail()),
        // MaterialPageRoute(builder: (context) => const Pharmacy()),
        // MaterialPageRoute(builder: (context) => const Article()),
        // MaterialPageRoute(builder: (context) => const Cart()),
        // MaterialPageRoute(builder: (context) => const Paymentdone()),
        // MaterialPageRoute(builder: (context) => const Profilescreen()),
      //   MaterialPageRoute(builder: (context) =>  Loggedout()),
      // );
    
    Navigator.pushNamedAndRemoveUntil(
        context,
        // Routes().ciHome,
        Routes().secondSplashScreen,
            (route) => false,
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("myApp"),
      //   backgroundColor: Colors.blue,
      // ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Center(
          child: Image.asset(
            'assets/logo/logo.jpg',
            width: 300,
            height: 150,
          ),
        ),
      ),
    );
  }
}
