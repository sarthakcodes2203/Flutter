import 'package:get/get.dart';
import 'package:my_app/controllers/otpController.dart';
import 'package:my_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verification extends StatefulWidget {
  Verification({super.key});
  String routeName = "/verification";

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification>
    with SingleTickerProviderStateMixin {
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

  var otpController = Get.put(OTPcontroller());
  var otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: Text('Change Password'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Add your back button functionality here
              Navigator.pushNamedAndRemoveUntil(
                context,
                // Routes().ciHome,
                Routes().forgotPassword,
                (route) => false,
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Verification',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 10),
              Text(
                "Enter OTP sent to your Phone Number ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 34),
            
              OtpTextField(
                // controller: otpController,
                numberOfFields: 6,
                borderColor: Colors.black,
                filled: true,
                // showFieldAsBox: true,
                onSubmit: (code) {
                  print("Code is $code");
                  otp = code;
                  OTPcontroller.instance.verifyOTP(otp);
                },
                // onCodeChanged: (String code) {
                //   // handle the OTP code change
                // },
              ),

              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().resetPassword,
                        (route) => false,
                      );
                      OTPcontroller.instance.verifyOTP(otp);
                    },
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
                        'Submit',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    // Routes().ciHome,
                    Routes().forgotPassword,
                    (route) => false,
                  );
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
