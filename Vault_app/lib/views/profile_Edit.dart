import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class ProfileEdit extends StatefulWidget {
  String routeName = "/profile_Edit";
  ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit>
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
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            ' Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().bottomBar,
              (route) => false,
                            arguments: 2, // Pass the _selectedIndex value as an argument

            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              icon: Icon(
                Icons.save,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().signUp,
              Routes().account,
              (route) => false,
            );

              },
            ),
          ),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: Container(
                height: 922,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.green],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment
                        .center, // Align the children at the center of the Stack
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 47,
                          backgroundImage: AssetImage('assets/dp.jpg'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Background color for the camera icon
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(
                              4), // Adjust padding for the icon size
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.cyan,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'John',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'john@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          decoration: InputDecoration(
                            hintText: '0000000000',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          decoration: InputDecoration(
                            hintText: '22/03/2024',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 22),
                        TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText:
                                '702 Iscon Empire, Jr. Star Bazaar\nJodhpur Cross Roads, Satellite.\nAhmedabad - 380015',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: 36),
                        ElevatedButton(
                          onPressed: () {
                            // Handle submit action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 123),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            elevation: 8,
                          ),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 21, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes().changePassword,
                              (route) => false,
                            );
                          },
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white, // Add this line
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
