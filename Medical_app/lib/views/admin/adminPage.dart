import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/admin/adminProfile.dart';
import 'package:my_app/views/admin/manageDoctors.dart';
import 'package:my_app/views/admin/manageMedicines.dart';
import 'package:my_app/views/admin/manageUsers.dart';

class Adminpage extends StatefulWidget {
  String routeName = "/adminPage";

  Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage>
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
        title: Text(
          'Admin Page',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().ciHome,
              Routes().secondSplashScreen,
              (route) => false,
            );
            // Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: Column(children: [
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Managedoctors(),
                      ),
                    );
                  },
                  child: Text(
                    'View Doctors',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Managemedicines(),
                      ),
                    );
                  },
                  child: Text(
                    'View Medicines',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 34),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Adminprofile(),
                      ),
                    );
                    },
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 43, 106, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Icons.man,color: Colors.white, size: 40),
                          Icon(FontAwesomeIcons.user,
                              color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text('Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    
                    },
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 43, 106, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text('Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Manageusers(),
                      ),
                    );
                    },
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 43, 106, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.supervised_user_circle_outlined,
                              color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text('Users',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _showLogoutDialog,
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(38, 43, 106, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout, color: Colors.red, size: 40),
                          SizedBox(height: 10),
                          Text('Logout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(FontAwesomeIcons.personWalkingArrowRight,
                  color: Color.fromARGB(255, 129, 129, 129), size: 24),
              SizedBox(width: 12),
              Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          actions: [
            Container(
              width: double.infinity,
              child: Row(
                children: [
                  // Expanded( child:
                  OutlinedButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 148, 148, 148)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        'Logout',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      onPressed: () {
                        // Add your logout functionality here
                        // Navigator.of(context).pop();

                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().secondSplashScreen,
                          (route) => false,
                        );

                        print(
                          'Logged out',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
