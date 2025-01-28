import 'package:my_app/routing/routes.dart';
import 'package:flutter/material.dart';

class Changepassword extends StatefulWidget {
  Changepassword({super.key});
  String routeName = "/changePassword";

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword>
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
                Routes().settings,
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
                'Change Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'Old Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'New Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: 'Confirm New Password',
                ),
                obscureText: true,
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
                        Routes().settings,
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
