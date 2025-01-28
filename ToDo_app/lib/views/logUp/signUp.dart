import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:todo_app/controllers/authenticationRepository.dart';
import 'package:todo_app/controllers/signupController.dart';
import 'package:todo_app/models/userModel.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/Password/verification.dart';
import 'package:todo_app/views/screenS/mainPage.dart';

class Signup extends StatefulWidget {
  Signup({super.key});
  String routeName = "/signUp";

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
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  bool _isChecked = false;

  bool _checkPasswordsMatch(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  String _password = '';
  String _confirmPassword = '';
  bool _passwordsMatch = true;

  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  bool _isPasswordVisible = false; // For toggling password visibility
  bool _isConfirmPasswordVisible = false; // For confirm password visibility

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.fullName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Full Name',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controller.email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controller.phoneNo,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'Phone Number',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controller
                          .password, // Ensure the controller is properly initialized
                      focusNode: _passwordFocusNode,
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
                      onChanged: (value) {
                        if (_password != value) {
                          _password = value;
                          // Check if passwords match but avoid calling setState unnecessarily
                          bool passwordsMatch =
                              _checkPasswordsMatch(_password, _confirmPassword);
                          if (_passwordsMatch != passwordsMatch) {
                            setState(() {
                              _passwordsMatch = passwordsMatch;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    // TextFormField(
                    //   // controller: controller .confirmPassword,
                    //   focusNode: _confirmPasswordFocusNode,
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(Icons.vpn_key),
                    //     labelText: 'Confirm Password',
                    //     suffixIcon: IconButton(
                    //       icon: Icon(
                    //         _isConfirmPasswordVisible
                    //             ? Icons.visibility
                    //             : Icons.visibility_off,
                    //       ),
                    //       onPressed: () {
                    //         setState(() {
                    //           _isConfirmPasswordVisible =
                    //               !_isConfirmPasswordVisible; // Toggle visibility
                    //         });
                    //       },
                    //     ),
                    //   ),
                    //   obscureText: !_isConfirmPasswordVisible,
                    //   onChanged: (value) {
                    //     if (_confirmPassword != value) {
                    //       _confirmPassword = value;
                    //       bool passwordsMatch =
                    //           _checkPasswordsMatch(_password, _confirmPassword);
                    //       if (_passwordsMatch != passwordsMatch) {
                    //         setState(() {
                    //           _passwordsMatch = passwordsMatch;
                    //         });
                    //       }
                    //     }
                    //   },
                    // ),
                    // _passwordsMatch
                    //     ? Container()
                    //     : Align(
                    //         alignment: Alignment.centerLeft,
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(left: 48),
                    //           child: Text(
                    //             'Passwords do not match',
                    //             style: TextStyle(color: Colors.red),
                    //           ),
                    //         ),
                    //       ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    // activeColor: Colors
                    //     .black,
                    // checkColor:
                    //     Colors.white,
                  ),
                  Text(
                    'I agree to the terms and conditions.',
                    style: TextStyle(
                      color: _isChecked ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().mainPage,
                        (route) => false,
                      );
                      if (_formKey.currentState!.validate()) {
                        
                        //Email and Password authentication>>>
                        Signupcontroller.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim(),
                        );

                        //Phone Number authentication>>>
                        // Signupcontroller.instance.phoneAuthentication(
                        //     controller.phoneNo.text.trim());

                        //All fields>>>
                        final user = Usermodel(
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                          fullName: controller.fullName.text.trim(),
                          phoneNo: controller.phoneNo.text.trim(),
                        );
                        Signupcontroller.instance
                            .createUser(user);

                        // Get.to(Mainpage());

                      }
                    },

                    // onPressed: () async {
                    //   if (_formKey.currentState!.validate()) {
                    //     final completer = Completer<void>();
                    //     // Trigger signup without expecting a returned future
                    //     Signupcontroller.instance.registerUser(
                    //       controller.email.text.trim(),
                    //       controller.password.text.trim(),
                    //     );
                    //     // Show success snackbar and complete future on signup success
                    //     completer.future.then((_) {
                    //       Get.snackbar(
                    //         "Signup Success",
                    //         "Your account has been created successfully!",
                    //         backgroundColor: Colors.green,
                    //         colorText: Colors.white,
                    //         snackPosition: SnackPosition.BOTTOM,
                    //         duration: Duration(seconds: 3),
                    //       );
                    //       Navigator.pushNamedAndRemoveUntil(
                    //         context,
                    //         Routes().mainPage,
                    //         (route) => false,
                    //       );
                    //     }).catchError((error) {
                    //       // Show error snackbar if signup fails
                    //       Get.snackbar(
                    //         "Signup Failed",
                    //         error.toString(),
                    //         backgroundColor: Colors.redAccent,
                    //         colorText: Colors.white,
                    //         snackPosition: SnackPosition.BOTTOM,
                    //         duration: Duration(seconds: 3),
                    //       );
                    //       print('11111111');
                    //     });
                    //     await completer.future;
                    //   }
                    // },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      // iconColor: Colors.brown,
                      side: BorderSide(width: 3, color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
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
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Color.fromARGB(220, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Log In',
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
                                Routes().logIn,
                                (route) => false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // SignupErrorWidget(), // Error widget added at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

class SignupErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final error = Authenticationrepository().errorMessage.value;
      if (error.isEmpty) return SizedBox.shrink();

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  error,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () =>
                    Authenticationrepository().errorMessage.value = '',
              ),
            ],
          ),
        ),
      );
    });
  }
}
