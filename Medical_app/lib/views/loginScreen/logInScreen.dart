import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class signIn extends StatefulWidget {
  String routeName = "/logIn";

  signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> with SingleTickerProviderStateMixin {
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

  bool _obscureText = true;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color to white
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/logo/logo.jpg',
                height: 200,
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
                        // errorText: "errortext",
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
                            ))),
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
                      errorText: _passwordError,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Add your forgot password logic here
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().forgotPassword,
                          (route) => false,
                        );
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().loggedIn,
                        (route) => false,
                      );

                      // setState(() {
                      //   // Replace the below condition with your actual password validation logic
                      //   if (1 + 2 > 3) {
                      //     _passwordError =
                      //         "Incorrect password. Please try again.";
                      //   } else {
                      //     _passwordError = null;
                      //     print("Signed In successfully");
                      //   }
                      // });
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
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ]),
              ),

              SizedBox(height:34),
              // Container(
              //   margin: EdgeInsets.fromLTRB(0, 0, 9.3, 104),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
              //         child: Stack(
              //           children: [
              //             Positioned(
              //               left: 0,
              //               right: 0,
              //               bottom: 14,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: Color(0xFFE5E7EB),
              //                 ),
              //                 child: Container(
              //                   width: 327,
              //                   height: 0,
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               decoration: BoxDecoration(
              //                 color: Color(0xFFFFFFFF),
              //               ),
              //               child: Container(
              //                 padding: EdgeInsets.fromLTRB(16.9, 4, 17.9, 3),
              //                 child: Text(
              //                   'OR',
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.w400,
              //                     fontSize: 16,
              //                     height: 1.5,
              //                     color: Color(0xFFA1A8B0),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Color(0xFFE5E7EB)),
              //               borderRadius: BorderRadius.circular(32),
              //               color: Color(0xFFFFFFFF),
              //             ),
              //             child: Container(
              //               padding: EdgeInsets.fromLTRB(18, 16, 0, 16),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
              //                     child: SizedBox(
              //                       width: 19.6,
              //                       height: 20,
              //                       child: Icon(
              //                         Icons.g_mobiledata_rounded,
              //                         color: Color.fromRGBO(38, 43, 106, 1),
              //                         size: 30,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     'Sign in with Google',
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 16,
              //                       height: 1.5,
              //                       color: Color(0xFF101623),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Container(
              //             margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Color(0xFFE5E7EB)),
              //               borderRadius: BorderRadius.circular(32),
              //               color: Color(0xFFFFFFFF),
              //             ),
              //             child: Container(
              //               padding: EdgeInsets.fromLTRB(18, 16, 0, 16),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
              //                     width: 16.8,
              //                     height: 20,
              //                     child: SizedBox(
              //                       width: 16.9,
              //                       height: 20,
              //                       child: Icon(
              //                         Icons.apple,
              //                         color: Color.fromRGBO(38, 43, 106, 1),
              //                         size: 30,
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     'Sign in with Apple',
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 16,
              //                       height: 1.5,
              //                       color: Color(0xFF101623),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //               border: Border.all(color: Color(0xFFE5E7EB)),
              //               borderRadius: BorderRadius.circular(32),
              //               color: Color(0xFFFFFFFF),
              //             ),
              //             child: Container(
              //               padding: EdgeInsets.fromLTRB(18, 16, 0, 16),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Container(
              //                     margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
              //                     child: Container(
              //                       decoration: BoxDecoration(
              //                         color: Color(0xFF3577E5),
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       child: Container(
              //                         width: 20,
              //                         height: 20,
              //                         padding:
              //                             EdgeInsets.fromLTRB(7, 4.1, 6.9, 4.1),
              //                         child: SizedBox(
              //                           width: 6.1,
              //                           height: 11.9,
              //                       child: Icon(
              //                         Icons.facebook,
              //                         color: Color.fromRGBO(38, 43, 106, 1),
              //                         size: 30,
              //                       ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   Text(
              //                     'Sign in with Facebook',
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.w600,
              //                       fontSize: 16,
              //                       height: 1.5,
              //                       color: Color(0xFF101623),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 16),
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
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().signUp,
                            (route) => false,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
