import 'package:flutter/material.dart';
import 'package:my_shop/routes/routes.dart';
import 'package:my_shop/views/UiEditor.dart';
import 'package:my_shop/views/bars.dart';
import 'package:my_shop/views/orderDetails.dart';
import 'package:my_shop/views/cartList.dart';
import 'package:my_shop/views/home.dart';
import 'package:my_shop/views/homeWithBottombar.dart';
import 'package:my_shop/views/productDetails.dart';
import 'package:my_shop/views/profile.dart';
import 'package:my_shop/views/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: Routes().splashScreen,
        routes: {
          /// Common Screens
          Routes().splashScreen: (context) => Splashscreen(),
          Routes().bars: (context) => Bars(),
          // Routes().oderDetails: (context) => Orderdetails(),
          Routes().cartList: (context) => Cartlist(),
          Routes().home: (context) => Home(),
          Routes().homeWithBottombar: (context) => Homewithbottombar(),
          // Routes().productDetails: (context) => ProductDetails(),
          Routes().profile: (context) => Profile(),
        });
  }
}
