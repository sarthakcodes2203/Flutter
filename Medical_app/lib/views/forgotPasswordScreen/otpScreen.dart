// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:my_app/routing/routes.dart';

// class Otpscreen extends StatefulWidget {
//   String routeName = "/otpScreen";

//   Otpscreen({super.key});

//   @override
//   State<Otpscreen> createState() => _OtpscreenState();
// }

// class _OtpscreenState extends State<Otpscreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   // List<TextEditingController> _controllers =
//   //     List.generate(4, (_) => TextEditingController());
// // Add these controllers to store the input values
//   final TextEditingController _controller1 = TextEditingController();
//   final TextEditingController _controller2 = TextEditingController();
//   final TextEditingController _controller3 = TextEditingController();
//   final TextEditingController _controller4 = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   // body: Center(
//     //   //   child: Padding(
//     //   //     padding: const EdgeInsets.all(16.0),
//     //   //     child: Column(
//     //   //       mainAxisAlignment: MainAxisAlignment.center,
//     //   //       children: <Widget>[
//     //   //         Text(
//     //   //           "OTP Verification",
//     //   //           style: TextStyle(
//     //   //             fontSize: 24,
//     //   //             color: Color.fromRGBO(38, 43, 106, 1),
//     //   //             fontWeight: FontWeight.w900,
//     //   //           ),
//     //   //         ),
//     //   //         SizedBox(height: 35),
//     //   //         TextFormField(
//     //   //           // controller: _otpController,
//     //   //           keyboardType: TextInputType.number,
//     //   //           maxLength: 6,
//     //   //           style: const TextStyle(height: 1.0, fontSize: 15.0),
//     //   //           decoration: InputDecoration(
//     //   //             hintText: "Enter OTP",
//     //   //             filled: true,
//     //   //             fillColor: Colors.white,
//     //   //             prefixIcon: const Icon(
//     //   //               Icons.lock,
//     //   //               color: Color.fromRGBO(38, 43, 106, 1),
//     //   //               size: 30,
//     //   //             ),
//     //   //             border: OutlineInputBorder(
//     //   //               borderRadius: BorderRadius.circular(50.0),
//     //   //               borderSide: const BorderSide(
//     //   //                 width: 2,
//     //   //                 color: Color.fromRGBO(38, 43, 106, 1),
//     //   //               ),
//     //   //             ),
//     //   //             // errorText: _isOtpValid ? null : 'Invalid OTP',
//     //   //           ),
//     //   //         ),
//     //   //         SizedBox(height: 20),
//     //   //         ElevatedButton(
//     //   //           onPressed:(){},
//     //   //           child: Text(
//     //   //             "Verify",
//     //   //             style: TextStyle(
//     //   //               fontSize: 20,
//     //   //               color: Colors.white,
//     //   //               fontWeight: FontWeight.w600,
//     //   //             ),
//     //   //           ),
//     //   //           style: ElevatedButton.styleFrom(
//     //   //             backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//     //   //             minimumSize: Size(double.infinity, 60),
//     //   //             shape: RoundedRectangleBorder(
//     //   //               borderRadius: BorderRadius.circular(18),
//     //   //             ),
//     //   //           ),
//     //   //         ),
//     //   //       ],
//     //   //     ),
//     //   //   ),
//     //   // ),
//     //     );

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//           onPressed: () {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               // Routes().ciHome,
//               Routes().forgotPassword,
//               (route) => false,
//             );
//             // Navigator.pop(context); // Go back to the previous screen
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20, right: 16, top: 34),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Enter Verification Code",
//                   style: TextStyle(
//                       fontSize: 26,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: 1.02),
//                 ),
//                 SizedBox(height: 30),
//                 Text(
//                   "Enter code that we have sent to \nyour number 7478147*** ",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.grey[500],
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 45),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(4, (index) {
//                     return SizedBox(
//                       width: 50,
//                       child: TextField(
//                         // controller: _controllers[index],

//                         keyboardType: TextInputType.number,
//                         maxLength: 1,
//                         textAlign: TextAlign.center,
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                           FilteringTextInputFormatter.digitsOnly
//                         ],
//                         style: TextStyle(fontSize: 24),
//                         decoration: InputDecoration(
//                           counterText: "",
//                           // filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                             borderSide: const BorderSide(
//                               width: 2,
//                               color: Color.fromRGBO(38, 43, 106, 1),
//                             ),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           if (value.isNotEmpty) {
//                             FocusScope.of(context).nextFocus();
//                           }
//                         },
//                         // onKey: (event) {
//                         //   if (event.logicalKey == LogicalKeyboardKey.backspace && event is KeyDownEvent) {
//                         //     if (index > 0) {
//                         //       FocusScope.of(context).previousFocus();
//                         //     }
//                         // }
//                       ),
//                     );
//                   }),
//                 ),
//                 SizedBox(height: 30),
//                 ElevatedButton(
//                   onPressed: () {
//                     String enteredCode = _controller1.text +
//                         _controller2.text +
//                         _controller3.text +
//                         _controller4.text;
//                     if (enteredCode == "7478") {
//                       Navigator.pushNamedAndRemoveUntil(
//                         context,
//                         Routes().newPasswordScreen,
//                         (route) => false,
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content: Text("Invalid code, please try again.")),
//                       );
//                     }
//                   },

//                   //   Navigator.pushNamedAndRemoveUntil(
//                   //     context,
//                   //     // Routes().ciHome,
//                   //     Routes().newPasswordScreen,
//                   //     (route) => false,
//                   //   );
//                   // },
//                   child: Text(
//                     "Verify",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//                     minimumSize: Size(double.infinity, 60),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 Center(
//                   child: RichText(
//                     text: TextSpan(
//                       text: '',
//                       style: TextStyle(color: Color(0xFF666666), fontSize: 16),
//                       children: [
//                         TextSpan(
//                           text: 'Didn\'t receive the code?  ',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                         TextSpan(
//                           text: 'Resend',
//                           style: TextStyle(
//                             color: Color.fromRGBO(38, 43, 106, 1),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                             decoration: TextDecoration.underline,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.pushNamedAndRemoveUntil(
//                                 context,
//                                 // Routes().ciHome,
//                                 Routes().forgotPassword,
//                                 (route) => false,
//                               );
//                             },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _verifyCode() {
//     String enteredCode = '';
//     // String enteredCode =
//     //     _controllers.map((controller) => controller.text).join('');
//     if (enteredCode == "7478") {
//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         // Replace with your actual route
//         Routes().newPasswordScreen,
//         (route) => false,
//       );
//     } else {
//       // Show an error message if the code is incorrect
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Invalid code, please try again.")),
//       );
//     }
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/routing/routes.dart';

class Otpscreen extends StatefulWidget {
  final String routeName = "/otpScreen";

  Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _controller1.text.isNotEmpty &&
          _controller2.text.isNotEmpty &&
          _controller3.text.isNotEmpty &&
          _controller4.text.isNotEmpty;
    });
  }

  var otp = 7478;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().forgotPassword,
              (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Enter Verification Code",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.02,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Enter the code we have sent to \nyour number 7478147***",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildOtpTextField(_controller1),
                    _buildOtpTextField(_controller2),
                    _buildOtpTextField(_controller3),
                    _buildOtpTextField(_controller4),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _isButtonEnabled ? _verifyCode : null,
                  child: Text(
                    "Verify",
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
                SizedBox(height: 40),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Didn\'t receive the code?  ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: 'Resend',
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
                                Routes().forgotPassword,
                                (route) => false,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpTextField(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(38, 43, 106, 1),
            ),
          ),
        ),
        onChanged: (value) {
          _updateButtonState();
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  void _verifyCode() {
    String enteredCode = _controller1.text +
        _controller2.text +
        _controller3.text +
        _controller4.text;

    if (enteredCode == "7478") {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes().newPasswordScreen,
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid code, please try again.")),
      );
    }
  }
}
