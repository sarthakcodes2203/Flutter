import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/controllers/phoneController.dart';
import 'package:todo_app/controllers/signupController.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/Password/verification.dart';

class Forgotpassword extends StatefulWidget {
  Forgotpassword({super.key});
  String routeName = "/forgotPassword";

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword>
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

  final controller = Get.put(Signupcontroller());

  final _formKey = GlobalKey<FormState>();

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
                Routes().logIn,
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
                'Forgot Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(
                height: 12,
              ),
              Text(
                'If you have forgotten your password, You can reset it!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 20),

              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.phone),
              //     labelText: 'Phone Number',
              //   ),
              //   obscureText: true,
              // ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: controller.phoneNo,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: 'Phone Number',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    // Add validation logic if needed
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 43),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().verification,
                        (route) => false,
                      );
                      if (_formKey.currentState!.validate()) {
                        Phonecontroller.instance.phoneAuthentication(
                            controller.phoneNo.text.trim());
                        // Get.to(Verification());
                      }
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
                        'Send OTP',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
