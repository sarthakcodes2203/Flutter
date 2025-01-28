import 'package:flutter/material.dart';
import 'package:my_app/views/homeScreen/mainScreen.dart';
import 'package:my_app/views/profileScreen/profileScreen.dart';
import 'package:my_app/views/signUpScreen/signUp.dart';
import 'package:my_app/views/splashScreen/secondSplashScreen.dart';

class Loggedout extends StatefulWidget {
    String routeName = "/loggedOut";

   Loggedout({super.key});

  @override
  State<Loggedout> createState() => _LoggedoutState();
}

class _LoggedoutState extends State<Loggedout>
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
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color.fromRGBO(38, 43, 106, 1),
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        automaticallyImplyLeading: false, // Add this line
      ),
      body: Stack(children: [
        Opacity(
          opacity: 0.1,
          child: Text('helo'),
        ),
        Center(
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Icon(
                    Icons.logout,
                    color: Color.fromRGBO(51, 56, 124, 0.949),
                    size: 50,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Are you sure to log out of your account?",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Color.fromRGBO(38, 43, 106, 1),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  // SizedBox(height: 15),
                  // Text(
                  //   "Your payment has been successful,\n you can have a consultation session with your trusted doctor",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     color: Colors.grey[500],
                  //   ),
                  // ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _signedIn = false;

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Secondsplashscreen()),
                        );
                      });
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                      minimumSize: Size(120, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      // onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mainscreen()),
                      );
                      // },
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 16, color: Color.fromRGBO(38, 43, 106, 1)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40), // specify height
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
