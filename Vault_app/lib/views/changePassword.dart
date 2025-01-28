import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Changepassword extends StatefulWidget {
  String routeName = "/changePassword";
  Changepassword({super.key});

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
        backgroundColor: Colors.cyan,
        title: Text(
          'Change Password',
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
              Routes().profile_Edit,
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
                    height: 230,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.rotate,
                            size: 80,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          // Text(
                          //   'Property\nVault',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 28,
                          //     height: 1,
                          //     letterSpacing: 2,
                          //     color: Colors.white,
                          //   ),
                          // ),
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
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Old Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),

                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),

                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Register Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().account,
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

                      SizedBox(height: 20),
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
