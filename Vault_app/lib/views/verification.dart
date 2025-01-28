import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Verification extends StatefulWidget {
  String routeName = "/verification";
  Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    startTimer();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Timer? _timer;
  int _start = 60; // Initialize _start to 60

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Verification',
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
              // Routes().signUp,
              Routes().forgotPassword,
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
                            FontAwesomeIcons.userLock,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            'We have sent you an access code\n           via email verification',
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: List.generate(4, (index) {
                      //     return SizedBox(
                      //       width: 50,
                      //       child: TextField(
                      //         keyboardType: TextInputType.number,
                      //         maxLength: 1,
                      //         textAlign: TextAlign.center,
                      //         inputFormatters: [
                      //           LengthLimitingTextInputFormatter(1),
                      //           FilteringTextInputFormatter.digitsOnly
                      //         ],
                      //         style: TextStyle(fontSize: 24),
                      //         decoration: InputDecoration(
                      //           counterText: "",
                      //           // filled: true,
                      //           // border: OutlineInputBorder(
                      //           //   borderRadius: BorderRadius.circular(8.0),
                      //           //   borderSide: const BorderSide(
                      //           //     width: 2,
                      //           //     color: Color.fromRGBO(38, 43, 106, 1),
                      //           //   ),
                      //           // ),
                      //         ),
                      //         onChanged: (value) {
                      //           if (value.isNotEmpty) {
                      //             FocusScope.of(context).nextFocus();
                      //           }
                      //         },
                      //         // onKey: (event) {
                      //         //   if (event.logicalKey == LogicalKeyboardKey.backspace && event is KeyDownEvent) {
                      //         //     if (index > 0) {
                      //         //       FocusScope.of(context).previousFocus();
                      //         //     }
                      //         // }
                      //       ),
                      //     );
                      //   }),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 50,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                counterText: "",
                                filled: true,
                                fillColor: Colors
                                    .grey[200], // Set the fill color to grey
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide.none, // Remove the border
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 28), // Add 16 pixels of padding to the left
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${(_start ~/ 60).toString().padLeft(2, '0')}:${(_start % 60).toString().padLeft(2, '0')}',
                            style: _start > 0
                                ? TextStyle(fontSize: 16, color: Colors.grey)
                                : TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 42),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            // Routes().logIn,           //In case of Registration
                            Routes().setPassword,  //In case of Forgot Password
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
                        onPressed: () {},
                        child: Text(
                          'Resend',
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
