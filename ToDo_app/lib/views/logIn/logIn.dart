import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';
import 'package:todo_app/controllers/signupController.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});
  String routeName = "/logIn";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
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

  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(Signupcontroller());

  bool _isPasswordVisible = false; // For toggling password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Change Password'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () {
          //     // Add your back button functionality here
          //   },
          // ),
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Log In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 34),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email Id',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null; // Returns null if input is valid
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                                  !_isPasswordVisible; // Toggle password visibility
                            });
                          },
                        ),
                      ),
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null; // Returns null if input is valid
                      },
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add your forgot password functionality here
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            // Routes().ciHome,
                            Routes().forgotPassword,
                            (route) => false,
                          );
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: const Color.fromARGB(213, 0, 0, 0)),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                // Attempt login
                                await Authenticationrepository()
                                    .loginWithEmailAndPassword(
                                  controller.email.text.trim(),
                                  controller.password.text.trim(),
                                );
                                // On successful login, navigate to main page
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes().mainPage,
                                  (route) => false,
                                );
                                // Optionally, show a success snackbar
                                Get.snackbar(
                                  "Login Successful",
                                  "You have been logged in successfully!",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                );
                              } on FirebaseAuthException catch (e) {
                                // Show error snackbar if Firebase authentication fails
                                Get.snackbar(
                                  "Login Failed",
                                  e.message ?? "An error occurred during login",
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                );
                              } catch (error) {
                                // Show a generic error snackbar for any other exceptions
                                Get.snackbar(
                                  "Login Failed",
                                  "An unknown error occurred during login",
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            side: BorderSide(width: 3, color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Text(
                              'Log In',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        )
                        // OutlinedButton(
                        //  onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       Signupcontroller.instance.registerUser(
                        //         controller.email.text.trim(),
                        //         controller.password.text.trim(),
                        //       );
                        //       Navigator.pushNamedAndRemoveUntil(
                        //         context,
                        //         // Routes().ciHome,
                        //         Routes().mainPage,
                        //         (route) => false,
                        //       );
                        //     }
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(19),
                        //     ),
                        //     // iconColor: Colors.brown,
                        //     side: BorderSide(width: 3, color: Colors.grey),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //       left: 12,
                        //       right: 12,
                        //     ),
                        //     child: Text(
                        //       'Log In',
                        //       style:
                        //           TextStyle(color: Colors.black, fontSize: 20),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: TextStyle(
                          color: Color.fromARGB(220, 0, 0, 0), fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(
                            color: Color.fromARGB(220, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(220, 0, 0, 0),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("tapped");
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
            ],
          ),
        ),
      ),
    );
  }
}
