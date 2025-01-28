import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Profile extends StatefulWidget {
  String routeName = "/profile";
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
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
            'Profile',
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
              // Routes().signUp,
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
                Icons.edit,
                size: 32,
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
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
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
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'John',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'john@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '0000000000',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '22/03/2024',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      Container(
                        width: double.infinity,
                        height: 55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Satellite, Ahmedabad',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
