import 'dart:ui';

import 'package:Accountings/routes/routes.dart';
import 'package:Accountings/views/Password/changePassword.dart';
import 'package:Accountings/views/Password/forgotPassword.dart';
import 'package:Accountings/views/Password/resetPassword.dart';
import 'package:Accountings/views/Password/verification.dart';
import 'package:Accountings/views/logIn/logIn.dart';
import 'package:Accountings/views/logUp/signUp.dart';
import 'package:Accountings/views/screenS/FormFillUp.dart';
import 'package:Accountings/views/screenS/formDetailsFillUp.dart';
import 'package:Accountings/views/screenS/mainPage.dart';
import 'package:Accountings/views/screenS/mainPageFilter.dart';
import 'package:Accountings/views/screenS/mainPageFilterOptions.dart';
import 'package:Accountings/views/screenS/notifications.dart';
import 'package:Accountings/views/screenS/profile.dart';
import 'package:Accountings/views/screenS/settings.dart';
import 'package:Accountings/views/screenS/settingsLogout.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});
    String routeName="/splashScreen";


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
      //   context,
      //   // MaterialPageRoute(builder: (context) => const Login()),
      //   // MaterialPageRoute(builder: (context) => const Signup()),
      //   // MaterialPageRoute(builder: (context) => const Changepassword()),
      //   // MaterialPageRoute(builder: (context) => const Forgotpassword()),
      //   // MaterialPageRoute(builder: (context) => const Verification()),
      //   // MaterialPageRoute(builder: (context) => const Resetpassword()),
      //   // MaterialPageRoute(builder: (context) => const Notifications()),
      //   // MaterialPageRoute(builder: (context) => const Mainpage()),
      //   // MaterialPageRoute(builder: (context) => const Profile()),
      //   // MaterialPageRoute(builder: (context) => const Settings()),
      //   // MaterialPageRoute(builder: (context) => const Settingslogout()),    not
      //   // MaterialPageRoute(builder: (context) => const Mainpagefilter()),       not
      //   // MaterialPageRoute(builder: (context) => const Mainpagefilteroptions()), not
      //   // MaterialPageRoute(builder: (context) => const Formfillup()),
      //   // MaterialPageRoute(builder: (context) => const Formdetailsfillup()),
      // );

      Navigator.pushNamedAndRemoveUntil(
          context,
          // Routes().ciHome,
          Routes().logIn,
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
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color to white
      ),
      // child: Center(
      //   child: ClipOval(
      //     child: Image.asset(
      //       'assets/logo.jpg',
      //       width: 300,
      //       height: 150,
      //     ),
      //   ),
      // ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 160,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage('assets/logo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
