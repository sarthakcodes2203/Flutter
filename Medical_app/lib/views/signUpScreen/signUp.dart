import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class SignUp extends StatefulWidget {
  String routeName = "/signUp";

  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
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

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  bool _obscureText = true;
  String? _passwordError;
  bool _isChecked = false;

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text != _confirmPasswordController.text) {
        _passwordError = "Confirm the password correctly!";
      } else {
        _passwordError = null;
      }
    });
  }

  String? _selectedCountry;
  String? _selectedState;

  List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'India',
  ];
  List<String> statesOfIndia = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/logo/logo.jpg',
                height: 200,
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

                  // // Password Field
                  // TextFormField(
                  //   // controller: _passwordController,
                  //   obscureText: _obscureText,
                  //   style: const TextStyle(height: 1.0, fontSize: 15.0),
                  //   decoration: InputDecoration(
                  //     hintText: "Password",
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     prefixIcon: const Icon(
                  //       Icons.password,
                  //       color: Color.fromRGBO(38, 43, 106, 1),
                  //       size: 30,
                  //     ),
                  //     suffixIcon: IconButton(
                  //       icon: Icon(
                  //         _obscureText
                  //             ? Icons.visibility
                  //             : Icons.visibility_off,
                  //         color: Color.fromRGBO(38, 43, 106, 1),
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           _obscureText = !_obscureText;
                  //         });
                  //       },
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(50.0),
                  //       borderSide: const BorderSide(
                  //         width: 2,
                  //         color: Color.fromRGBO(38, 43, 106, 1),
                  //       ),
                  //     ),
                  //     errorText: _passwordError,
                  //   ),
                  // ),
                  // SizedBox(height: 15),

                  // // Confirm Password Field
                  // TextFormField(
                  //   controller: _confirmPasswordController,
                  //   obscureText: _obscureText,
                  //   style: const TextStyle(height: 1.0, fontSize: 15.0),
                  //   decoration: InputDecoration(
                  //     hintText: "Confirm Password",
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     prefixIcon: const Icon(
                  //       Icons.lock_outline,
                  //       color: Color.fromRGBO(38, 43, 106, 1),
                  //       size: 30,
                  //     ),
                  //     suffixIcon: IconButton(
                  //       icon: Icon(
                  //         _obscureText
                  //             ? Icons.visibility
                  //             : Icons.visibility_off,
                  //         color: Color.fromRGBO(38, 43, 106, 1),
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           _obscureText = !_obscureText;
                  //         });
                  //       },
                  //     ),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(50.0),
                  //       borderSide: const BorderSide(
                  //         width: 2,
                  //         color: Color.fromRGBO(38, 43, 106, 1),
                  //       ),
                  //     ),
                  //     errorText: _passwordError,
                  //   ),
                  // ),

                  // Country Field
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.flag,
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
                    hint: const Text(
                      "Country",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ), // Use this instead of hintText
                    items: countries.map((country) {
                      return DropdownMenuItem(
                        child: Text(country),
                        value: country,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value as String?;
                      });
                    },
                    value: _selectedCountry,
                    style: const TextStyle(
                        color: Colors.black, height: 1.0, fontSize: 15.0),
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true, // Add this
                  ),
                  SizedBox(height: 15),

                  // State Field
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.flag,
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
                    hint: const Text(
                      "State",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    items: statesOfIndia.map((state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedState = value;
                      });
                    },
                    value: _selectedState,
                    style: const TextStyle(
                        color: Colors.black, height: 1.0, fontSize: 15.0),
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                  ),
                  SizedBox(height: 15),

                  // City/Town Field
                  TextFormField(
                    style: const TextStyle(height: 1.0, fontSize: 15.0),
                    decoration: InputDecoration(
                      hintText: "City/Town",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.location_city,
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

                  // House Number Field
                  TextFormField(
                    style: const TextStyle(height: 1.0, fontSize: 15.0),
                    decoration: InputDecoration(
                      hintText: "House Number",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.home,
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

                  // Password field
                  TextFormField(
                    obscureText: _obscureTextPassword,
                    controller: _passwordController,
                    style: const TextStyle(height: 1.0, fontSize: 15.0),
                    decoration: InputDecoration(
                      hintText: "Create Password",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color.fromRGBO(38, 43, 106, 1),
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureTextPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromRGBO(38, 43, 106, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextPassword = !_obscureTextPassword;
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
                      // errorText: _passwordError,
                    ),
                    onChanged: (_) {
                      _validatePasswords(); // Validate whenever the text changes
                    },
                  ),
                  SizedBox(height: 15),

                  // Confirm Password field
                  TextFormField(
                    obscureText: _obscureTextConfirmPassword,
                    controller: _confirmPasswordController,
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
                          _obscureTextConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromRGBO(38, 43, 106, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirmPassword =
                                !_obscureTextConfirmPassword;
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
                      // errorText: _passwordError,
                    ),
                    onChanged: (_) {
                      _validatePasswords(); // Revalidate passwords on each change
                    },
                  ),
                  SizedBox(height: 15),

                  if (_passwordError != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          _passwordError!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().signedUp,
                        (route) => false,
                      );

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
              SizedBox(height: 44),
              RichText(
                text: TextSpan(
                  text: '',
                  style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Color.fromRGBO(38, 43, 106, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign In',
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
                            Routes().logIn,
                            (route) => false,
                          );
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //     child: Column(children: [
      //   Center(
      //     child: Row(children: [
      //       Text(
      //         'Already have an account?',
      //         style: TextStyle(
      //           color: Color.fromRGBO(38, 43, 106, 1),
      //           fontSize: 16,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //       Text(
      //         'Sign In',
      //         style: TextStyle(
      //           color: Color.fromRGBO(38, 43, 106, 1),
      //           fontSize: 18,
      //           fontWeight: FontWeight.w600,
      //           decoration: TextDecoration.underline,
      //         ),
      //       )
      //     ]),
      //   ),
      // ]))
    );
  }
}
