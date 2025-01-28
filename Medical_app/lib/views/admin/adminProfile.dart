import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Adminprofile extends StatefulWidget {
  const Adminprofile({super.key});

  @override
  State<Adminprofile> createState() => _AdminprofileState();
}

class _AdminprofileState extends State<Adminprofile>
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
          'Admin Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              letterSpacing: 1.02,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes().mainScreen,
            //   (route) => false,
            // );
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: Column(
        children: [
          _buildHeader(
            profileImagePath: 'assets/profile/dp.jpg',
            name: 'Mr. Sarthak Chakraborty',
          ),
          _buildMenuOptions(context),
        ],
      ),
    );
  }
}

Widget _buildHeader({
  required String profileImagePath,
  required String name,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    decoration: BoxDecoration(
      color: Color.fromRGBO(38, 43, 106, 1),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(profileImagePath),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ],
    ),
  );
}

Widget _buildMenuOptions(BuildContext context) {
  return Expanded(
    child: ListView(
      children: [
        ListTile(
          leading: Icon(Icons.favorite, color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'My Saved',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle menu item tap
          },
        ),
        ListTile(
          leading:
              Icon(Icons.calendar_today, color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'Recently Edited',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            //  Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   // Routes().ciHome,
            //   Routes().loggedOut,
            //   (route) => false,
            // );
          },
        ),
        ListTile(
          leading: Icon(Icons.question_answer,
              color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'More',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle menu item tap
          },
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().secondSplashScreen,
              (route) => false,
            );
          },
          child: ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //  Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   // Routes().ciHome,
            //   Routes().loggedOut,
            //   (route) => false,
            // );
            // },
          ),
        )
      ],
    ),
  );
}
