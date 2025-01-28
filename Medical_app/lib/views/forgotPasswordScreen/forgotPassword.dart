import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import

class Forgotpassword extends StatefulWidget {
  String routeName = "/forgotPassword";

  Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true;
  bool _isSendButtonClicked = false;

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

  // var recieverEmail = 'chakrabortysarthak5@gmail.com';

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  Future<void> _sendResetPasswordEmail() async {
    final email = _emailController.text;

    if (_isValidEmail(email)) {
      // Use the entered email address as the recieverEmail
      var recieverEmail = email;

      // Create a Mailto object
      final mailtoLink = Mailto(
        to: [recieverEmail],
        subject: 'Reset Password',
        body: 'Your OTP for Digvijayam password reset is: 7478',
      );

      // Convert the Mailto object to a URL
      final url = mailtoLink.toString();

      // Open the email app with the URL
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
        // Display a success message or confirmation dialog
        ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar(content: Text('Email sent successfully!')),
          SnackBar(
              content: Text(
            'Failed to send email',
            style: TextStyle(color: Colors.red, fontSize: 15),
          )),
        );
      } else {
        // Handle the error case
        ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar(content: Text('Failed to send email')),
          SnackBar(
              content: Text(
            'Email sent successfully!',
            style: TextStyle(color: Colors.green, fontSize: 15),
          )),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email address'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().logIn,
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(38, 43, 106, 1),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Please, enter your email address. You will receive a link to create a new password via email.',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 16),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _isEmailValid
                      ? null
                      : 'Not a valid email address. Should be your@email.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!_isValidEmail(value)) {
                    return 'Not a valid email address. Should be your@email.com';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _isEmailValid = _isValidEmail(value);
                  });
                },
              ),
            ),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _sendResetPasswordEmail();
                  setState(() {
                    _isSendButtonClicked = true;
                  });
                }
              },
              child: Text(
                'SEND',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed: _isSendButtonClicked
                  ? () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes().otpScreen,
                        (route) => false,
                      );
                    }
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please click the give email'),
                        ),
                      );
                    },
              // onPressed: () {
              //   Navigator.pushNamedAndRemoveUntil(
              //     context,
              //     Routes().otpScreen,
              //     (route) => false,
              //   );
              // },
              child: Text(
                'Enter OTP',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ],
        ),
      ),
    );
  }
}
