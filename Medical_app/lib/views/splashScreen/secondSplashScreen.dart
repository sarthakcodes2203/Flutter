import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/routing/routes.dart';

class Secondsplashscreen extends StatefulWidget {
  String routeName = "/secondSplashScreen";

  Secondsplashscreen({super.key});

  @override
  State<Secondsplashscreen> createState() => _SecondsplashscreenState();
}

class _SecondsplashscreenState extends State<Secondsplashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Spacer(),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Image.asset(
                  'assets/logo/logo.jpg',
                  width: 220,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                "Let's Get Started!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              // SizedBox(
              //   width: 30,
              // ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    "Login to enjoy the features we've provided,\n and stay healthy!",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    // Routes().ciHome,
                    Routes().logIn,
                    (route) => false,
                  );
                },
                child: Text(
                  "Sign-In",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                    minimumSize: Size(330, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(38))),
              ),

              // SizedBox(
              //   width: 20,
              // ),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    // Routes().ciHome,
                    Routes().signUp,
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 130.0, vertical: 12.0), // Adjust padding
                ),
                child: Text(
                  "Sign-Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Spacer(),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes().adminOptions,
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 130.0, vertical: 12.0), // Adjust padding
                ),
                child: Text(
                  "Admin--Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Spacer(),

            ],
          ),
        ),
      ),
    );
  }

}

