import 'package:firebase_core/firebase_core.dart';
import 'package:get/instance_manager.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/routes/routes.dart';
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
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(Authenticationrepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.light),
        themeMode: ThemeMode.system,

        // home: Splashscreen(),
        initialRoute: Routes().splashScreen,
        routes: {
          /// Common Screens
          Routes().splashScreen: (context) => Splashscreen(),
          Routes().changePassword: (context) => Changepassword(),
          Routes().forgotPassword: (context) => Forgotpassword(),
          Routes().resetPassword: (context) => Resetpassword(),
          Routes().verification: (context) => Verification(),
          Routes().logIn: (context) => Login(),
          Routes().signUp: (context) => Signup(),
          Routes().mainPage: (context) => Mainpage(),
          Routes().profile: (context) => Profile(),
          Routes().profileUpdate: (context) => UpdateProfileScreen(),
          Routes().profileUserManagement: (context) => Profileusermanagement(),
          Routes().settings: (context) => Settings(),
        });
  }
}
