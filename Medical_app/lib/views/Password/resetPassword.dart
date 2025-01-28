import 'package:my_app/routing/routes.dart';
import 'package:flutter/material.dart';

class Resetpassword extends StatefulWidget {
  Resetpassword({super.key});
  String routeName = "/resetPassword";

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword>
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
                Routes().verification,
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
                'Reset Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 20),
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.vpn_key),
              //     labelText: 'New Password',
              //   ),
              //   obscureText: true,
              // ),
              // SizedBox(height: 16),
              // TextField(
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.vpn_key),
              //     labelText: 'Confirm New Password',
              //   ),
              //   obscureText: true,
              // ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                    _passwordsMatch =
                        _checkPasswordsMatch(_password, _confirmPassword);
                  });
                },
              ),
              _passwordsMatch
                  ? Container()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 48),
                        child: Text(
                          'Passwords do not match',
                          style: TextStyle(color: Colors.red),
                        ),
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
                        Routes().logIn,
                        (route) => false,
                      );
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
            ],
          ),
        ));
  }
}
