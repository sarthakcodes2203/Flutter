import 'package:flutter/material.dart';
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
import 'package:pro_vault/views/settings.dart';
import 'package:pro_vault/views/signUp.dart';
import 'package:pro_vault/views/splashScreen.dart';
import 'package:pro_vault/views/timeClock.dart';
import 'package:pro_vault/views/verification.dart';
import 'package:pro_vault/views/workOrder.dart';

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
        // onGenerateRoute: (settings) {
        //   if (settings.name == '/bottomBar') {
        //     final int initialIndex = settings.arguments as int? ?? 0;
        //     return MaterialPageRoute(
        //       builder: (context) => Bottombar(initialIndex: initialIndex),
        //     );
        //   }
        // },
        routes: {
          /// Common Screens
          Routes().splashScreen: (context) => Splashscreen(),
          Routes().account: (context) => Account(),
          Routes().bottomBar: (context) => Bottombar(),
          Routes().calender: (context) => Calendar(),
          Routes().changePassword: (context) => Changepassword(),
          Routes().forgotPassword: (context) => Forgotpassword(),
          Routes().location: (context) => Location(),
          Routes().logIn: (context) => Login(),
          Routes().notes_AddEdit: (context) => NotesAddEdit(),
          Routes().notes: (context) => Notes(),
          Routes().notifications: (context) => Notifications(),
          Routes().orderDetails: (context) => Orderdetails(),
          Routes().profile_Edit: (context) => ProfileEdit(),
          Routes().profile: (context) => Profile(),
          Routes().setPassword: (context) => Setpassword(),
          Routes().settings: (context) => Settings(),
          Routes().signUp: (context) => Signup(),
          Routes().timeClock: (context) => Timeclock(),
          Routes().verification: (context) => Verification(),
          Routes().workOrder: (context) => Workorder(),
        });
  }
}
