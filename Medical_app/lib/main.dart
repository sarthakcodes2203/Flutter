import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
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
import 'package:my_app/views/pharmacy/pharmacy.dart';
import 'package:my_app/views/profileScreen/loggedOut.dart';
import 'package:my_app/views/profileScreen/profileScreen.dart';
import 'package:my_app/views/signUpScreen/signUp.dart';
import 'package:my_app/views/signUpScreen/signedUp.dart';
import 'package:my_app/views/splashScreen/secondSplashScreen.dart';
import 'package:my_app/views/splashScreen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter services are ready
//   try {
//     await Firebase.initializeApp();
//     runApp(MyApp());
//   } catch (e) {
//     print("Firebase initialization error: $e");
//   }
// }

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
          Routes().secondSplashScreen: (context) => Secondsplashscreen(),
          Routes().logIn: (context) => signIn(),
          Routes().loggedIn: (context) => signedIn(),
          Routes().signUp: (context) => SignUp(),
          Routes().signedUp: (context) => Signedup(),
          Routes().forgotPassword: (context) => Forgotpassword(),
          Routes().otpScreen: (context) => Otpscreen(),
          Routes().newPasswordScreen: (context) => Newpasswordscreen(),
          Routes().newPasswordCreatedScreen: (context) => Newpasswordcreatedscreen(),
          Routes().homeScreen: (context) => Homescreen(),
          Routes().findDoctorsScreen: (context) => Finddoctorsscreen(),
          Routes().doctorDetails: (context) => Doctordetails(doctor: {},),
          Routes().appointment: (context) => Appointment(doctor: {},),
          Routes().appointmentDone: (context) => Appointmentdone(),
          Routes().schedule: (context) => Schedule(),
          Routes().topDoctorsScreen: (context) => Topdoctorscreen(),
          Routes().pharmacy: (context) => Pharmacy(),
          // Routes().drugDetail: (context) => Drugdetail(),
          Routes().cart: (context) => Cart(),
          Routes().paymentDone: (context) => Paymentdone(),
          Routes().article: (context) => Article(),
          Routes().profileScreen: (context) => Profilescreen(),
          Routes().loggedOut: (context) => Loggedout(),
          Routes().mainScreen: (context) => Mainscreen(),
          Routes().adminOptions: (context) => Adminpage(),
        });
  }
}
