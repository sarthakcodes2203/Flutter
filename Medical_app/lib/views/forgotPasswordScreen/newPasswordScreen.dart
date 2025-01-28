// import 'package:flutter/material.dart';
// import 'package:my_app/routing/routes.dart';

// class Newpasswordscreen extends StatefulWidget {
//     String routeName = "/newPasswordScreen";

//    Newpasswordscreen({super.key});

//   @override
//   State<Newpasswordscreen> createState() => _NewpasswordscreenState();
// }

// class _NewpasswordscreenState extends State<Newpasswordscreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   bool _obscureText = true;
//   String? _passwordError;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Padding(
//       //   padding: const EdgeInsets.all(24.0),
//       //   child: Column(
//       //     children: [
//       //       Text(
//       //         'Create new password',
//       //         style: TextStyle(
//       //           fontSize: 24,
//       //           fontWeight: FontWeight.bold,
//       //           color: Colors.deepPurple,
//       //         ),
//       //       ),
//       //       SizedBox(height: 16),
//       //       TextField(
//       //         decoration: InputDecoration(
//       //           labelText: 'New Password',
//       //           labelStyle: TextStyle(color: Colors.grey),
//       //           border: OutlineInputBorder(
//       //             borderRadius: BorderRadius.circular(10),
//       //           ),
//       //           focusedBorder: OutlineInputBorder(
//       //             borderSide: BorderSide(color: Colors.deepPurple),
//       //             borderRadius: BorderRadius.circular(10),
//       //           ),
//       //         ),
//       //         obscureText: true,
//       //         style: TextStyle(fontSize: 18),
//       //       ),
//       //       SizedBox(height: 16),
//       //       TextField(
//       //         decoration: InputDecoration(
//       //           labelText: 'Confirm Password',
//       //           labelStyle: TextStyle(color: Colors.grey),
//       //           border: OutlineInputBorder(
//       //             borderRadius: BorderRadius.circular(10),
//       //           ),
//       //           focusedBorder: OutlineInputBorder(
//       //             borderSide: BorderSide(color: Colors.deepPurple),
//       //             borderRadius: BorderRadius.circular(10),
//       //           ),
//       //         ),
//       //         obscureText: true,
//       //         style: TextStyle(fontSize: 18),
//       //       ),
//       //       SizedBox(height: 24),
//       //       ElevatedButton(
//       //         onPressed: () {},
//       //         child: Text('Create Password'),
//       //         style: ElevatedButton.styleFrom(
//       //           iconColor: Colors.deepPurple,
//       //           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       //           textStyle: TextStyle(fontSize: 18),
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),

//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 16, top: 122),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Create New Password",
//                 style: TextStyle(
//                     fontSize: 26,
//                     fontWeight: FontWeight.w800,
//                     letterSpacing: 1.02),
//               ),
//               SizedBox(height: 15),

//               Text(
//                 "Create your new password to login",
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.grey[500],
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 30),

//               // Password Field
//               TextFormField(
//                 // controller: _passwordController,
//                 obscureText: _obscureText,
//                 style: const TextStyle(height: 1.0, fontSize: 15.0),
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.password,
//                     color: Color.fromRGBO(38, 43, 106, 1),
//                     size: 30,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50.0),
//                     borderSide: const BorderSide(
//                       width: 2,
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                     ),
//                   ),
//                   errorText: _passwordError,
//                 ),
//               ),
//               SizedBox(height: 15),

//               // Confirm Password Field
//               TextFormField(
//                 // controller: _confirmPasswordController,
//                 obscureText: _obscureText,
//                 style: const TextStyle(height: 1.0, fontSize: 15.0),
//                 decoration: InputDecoration(
//                   hintText: "Confirm Password",
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     Icons.lock_outline,
//                     color: Color.fromRGBO(38, 43, 106, 1),
//                     size: 30,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility : Icons.visibility_off,
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50.0),
//                     borderSide: const BorderSide(
//                       width: 2,
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                     ),
//                   ),
//                   errorText: _passwordError,
//                 ),
//               ),
//               SizedBox(height: 30),

//               ElevatedButton(
//                 onPressed: () {
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         // Routes().ciHome,
//                         Routes().newPasswordCreatedScreen,
//                         (route) => false,
//                       );
//                 },
//                 child: Text(
//                   "Confirm",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//                   minimumSize: Size(double.infinity, 60),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Newpasswordscreen extends StatefulWidget {
  String routeName = "/newPasswordScreen";

  Newpasswordscreen({super.key});

  @override
  State<Newpasswordscreen> createState() => _NewpasswordscreenState();
}

class _NewpasswordscreenState extends State<Newpasswordscreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureText = true;
  String? _passwordError;
// Add these variables to manage the individual obscure text states
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    setState(() {
      if (_passwordController.text != _confirmPasswordController.text) {
        _passwordError = "Passwords do not match";
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().otpScreen,
              (route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 16, top: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Create New Password",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.02,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Create your new password to login",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),

              // Replace the previous TextFormField for the Password field
              TextFormField(
                obscureText: _obscureTextPassword,
                controller: _passwordController,
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

              // Replace the previous TextFormField for the Confirm Password field
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _passwordError!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              
              SizedBox(height: 30),

              ElevatedButton(
                // onPressed: _validatePasswords,
                onPressed: () {
                  _validatePasswords();

                  if (_passwordError == null) {
                    // Passwords match, navigate to the desired screen
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().newPasswordCreatedScreen,
                      (route) => false,
                    );
                  } else {
                    // Passwords don't match, do nothing or show a message
                    setState(() {
                      // This forces the widget to rebuild and show the error message
                    });
                  }
                },
                child: Text(
                  "Confirm",
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
            ],
          ),
        ),
      ),
    );
  }
}
