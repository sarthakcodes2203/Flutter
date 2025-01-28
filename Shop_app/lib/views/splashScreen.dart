import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shop/views/home.dart';
import 'package:my_shop/views/homeWithBottombar.dart';


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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  Homewithbottombar()),
      );

      // Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     Routes().logIn,
      //         (route) => false,
      //   );
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
                FontAwesomeIcons.shop,
                size: 66,
                color: Colors.white,
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                'Shop',
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
