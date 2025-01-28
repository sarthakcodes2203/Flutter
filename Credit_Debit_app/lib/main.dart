import 'package:Accountings/routes/routes.dart';
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
import 'package:flutter/material.dart';

void main() {
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
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),

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
          Routes().formFillUp: (context) => Formfillup(),
          Routes().formDetailsFillUp: (context) => Formdetailsfillup(),
          Routes().mainPage: (context) => Mainpage(),
          Routes().notifications: (context) => Notifications(),
          Routes().profile: (context) => Profile(),
          Routes().settings: (context) => Settings(),
        });
  }
}


