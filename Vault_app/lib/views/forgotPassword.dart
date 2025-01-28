import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Forgotpassword extends StatefulWidget {
  String routeName = "/forgotPassword";
  Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword>
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
        backgroundColor: Colors.cyan,
        title: Text(
          'Forgot Password',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().logIn,
              (route) => false,
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              height: 422,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  // add circular borders to bottom
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.unlockKeyhole,
                            size: 60,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            'Please enter your email id to\n  recieve a verification code',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              // height: 1,
                              // letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // add your other widgets here
                ],
              ),
            ),
          ),
          Center(
            child: Card(
              margin: EdgeInsets.only(left: 32, right: 32, top: 134, bottom: 4),
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Register Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().verification,
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),

                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().logIn,
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        ),
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
