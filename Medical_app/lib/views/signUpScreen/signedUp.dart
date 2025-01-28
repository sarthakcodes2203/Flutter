import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Signedup extends StatefulWidget {
  String routeName = "/signedUp";

  Signedup({super.key});

  @override
  State<Signedup> createState() => _SignedupState();
}

class _SignedupState extends State<Signedup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  String? _passwordError;
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo/logo.jpg',
                      height: 320,
                      width: 180,
                    ),
                    Text(
                      "Sign-Up",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(38, 43, 106, 1),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: Column(children: [
                        // Name Field
                        TextFormField(
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                              // errorText: "errortext",
                              hintText: "Name",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.man,
                                color: Color.fromRGBO(38, 43, 106, 1),
                                size: 30,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(38, 43, 106, 1),
                                  ))),
                        ),
                        SizedBox(height: 15),

                        // Enail Field
                        TextFormField(
                          // validator: isEmailvalidate(_emailcontroller.text),
                          controller: _emailcontroller,
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                              // errorText: "errortext",
                              hintText: "Email",
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.mail_outline,
                                color: Color.fromRGBO(38, 43, 106, 1),
                                size: 30,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(38, 43, 106, 1),
                                  ))),
                        ),
                        SizedBox(height: 15),

                        // Password Field
                        TextFormField(
                          // controller: _passwordController,
                          obscureText: _obscureText,
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Color.fromRGBO(38, 43, 106, 1),
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                            ),
                            errorText: _passwordError,
                          ),
                        ),
                        SizedBox(height: 15),

                        // Confirm Password Field
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureText,
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color.fromRGBO(38, 43, 106, 1),
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                            ),
                            errorText: _passwordError,
                          ),
                        ),
                        SizedBox(height: 15),
                        // CheckBox
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
                            Text(
                              "I agree to the medidoc Terms of Service and \nPrivacy Policy",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30),
                        // Button
                        ElevatedButton(
                          onPressed: () {
                            print("Signed In ");

                            setState(() {
                              if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                _passwordError = "Passwords do not match";
                              } else {
                                _passwordError = null;
                                print("Signed In successfully");
                              }
                            });
                          },
                          child: Text(
                            "Sign-Up",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                              minimumSize: Size(double.infinity, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                        ),
                      ]),
                    ),
                    SizedBox(height: 150),
                    RichText(
                      text: const TextSpan(
                        text: '',
                        style:
                            TextStyle(color: Color(0xFF666666), fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                                color: Color.fromRGBO(38, 43, 106, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Color.fromRGBO(38, 43, 106, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // if (_signedUp)
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
                      Icons.check_circle,
                      color: Color.fromRGBO(51, 56, 124, 0.949),
                      size: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Success",
                      style: TextStyle(
                        fontSize: 20,
                        // color: Color.fromRGBO(38, 43, 106, 1),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Your account has been successfully \nregistered",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                                              Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().mainScreen,
                        (route) => false,
                      );


                        setState(() {
                          // _signedIn = false;
                        });
                      },
                      child: Text(
                        "Login",
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
