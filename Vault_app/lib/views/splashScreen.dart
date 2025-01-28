import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';
import 'package:pro_vault/views/account.dart';
import 'package:pro_vault/views/bottomBar.dart';
import 'package:pro_vault/views/calendar.dart';
import 'package:pro_vault/views/changePassword.dart';
import 'package:pro_vault/views/forgotPassword.dart';
import 'package:pro_vault/views/location.dart';
import 'package:pro_vault/views/logIn.dart';
import 'package:pro_vault/views/notes.dart';
import 'package:pro_vault/views/notes_AddEdit.dart';
import 'package:pro_vault/views/notifications.dart';
import 'package:pro_vault/views/orderDetails.dart';
import 'package:pro_vault/views/profile.dart';
import 'package:pro_vault/views/profile_Edit.dart';
import 'package:pro_vault/views/setPassword.dart';
import 'package:pro_vault/views/signUp.dart';
import 'package:pro_vault/views/timeClock.dart';
import 'package:pro_vault/views/verification.dart';
import 'package:pro_vault/views/workOrder.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});
  String routeName = "/splashScreen";

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
      //   // MaterialPageRoute(builder: (context) => const Verification()),
      //   // MaterialPageRoute(builder: (context) => const Setpassword()),
      //   // MaterialPageRoute(builder: (context) => const Forgotpassword()),
      //   // MaterialPageRoute(builder: (context) => const Changepassword()),
      //   // MaterialPageRoute(builder: (context) => const Account()),
      //   // MaterialPageRoute(builder: (context) => const Profile()),
      //   // MaterialPageRoute(builder: (context) => const ProfileEdit()),
      //   // MaterialPageRoute(builder: (context) => const Workorder()),
      //   // MaterialPageRoute(builder: (context) => const Orderdetails()),
      //   // MaterialPageRoute(builder: (context) => const Timeclock()),
      //   // MaterialPageRoute(builder: (context) => const Notes()),
      //   // MaterialPageRoute(builder: (context) => const NotesAddEdit()),
      //   // MaterialPageRoute(builder: (context) => const Notifications()),
      //   // MaterialPageRoute(builder: (context) => const Calendar()),
      //   // MaterialPageRoute(builder: (context) => const Location()),
      //   // MaterialPageRoute(builder: (context) => const Bottombar()),
      // );

      Navigator.pushNamedAndRemoveUntil(
          context,
          Routes().logIn,
              (route) => false,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.vault,
                size: 66,
                color: Colors.white,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                'Property\nVault',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 44,
                  height: 1,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
