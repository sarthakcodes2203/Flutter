import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Signup extends StatefulWidget {
  String routeName = "/signUp";
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
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

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.cyan,
      // ),
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
                    height: 190,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.vault,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                            'Property\nVault',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              height: 1,
                              letterSpacing: 2,
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

                      // Full Name TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Birth Date TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Birth Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Location TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Mobile Number TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Email TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Password TextField
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Confirm Password TextField
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),

                      SizedBox(height: 12),

                      // Terms and Privacy Policy
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'terms',
                                    style: TextStyle(color: Colors.cyan),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'privacy policy',
                                    style: TextStyle(color: Colors.cyan),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

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
                          'Register',
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

                      // Login
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().logIn,
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Login →',
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        ),
                      ),
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
