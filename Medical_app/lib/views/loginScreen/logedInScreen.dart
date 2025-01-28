import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class signedIn extends StatefulWidget {
  String routeName = "/loggedIn";

  signedIn({super.key});

  @override
  State<signedIn> createState() => _signedInState();
}

class _signedInState extends State<signedIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _obscureText = true;
  bool _signedIn = false;

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
      body: Stack(
        children: [
          Opacity(
            // opacity: _signedIn ? 0.1 : 1.0,
            opacity: 0.1,
            child: Container(
              color: Colors.white, // Set the background color to white
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo/logo.jpg',
                      height: 320,
                      width: 180,
                    ),
                    Text(
                      "Sign-In",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(38, 43, 106, 1),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: Column(children: [
                        TextFormField(
                          style: const TextStyle(height: 1.0, fontSize: 15.0),
                          decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Color.fromRGBO(38, 43, 106, 1),
                              size: 30,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color.fromRGBO(38, 43, 106, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
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
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Add your forgot password logic here
                              print("Forgot Password button pressed");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color.fromRGBO(38, 43, 106, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _signedIn = true;
                            });
                            print("Signed In successfully");
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
                            minimumSize: Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 200),
                    RichText(
                      text: const TextSpan(
                        text: '',
                        style:
                            TextStyle(color: Color(0xFF666666), fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                              color: Color.fromRGBO(38, 43, 106, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
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
          // if (_signedIn)
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
                      "Yaay! Welcome Back",
                      style: TextStyle(
                        fontSize: 20,
                        // color: Color.fromRGBO(38, 43, 106, 1),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Once again you login successfully\ninto medidoc app",
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

                        // setState(() {
                        //   _signedIn = false;
                        // });
                      },
                      child: Text(
                        "Go to home",
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
