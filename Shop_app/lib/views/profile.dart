import 'package:flutter/material.dart';
import 'package:my_shop/routes/routes.dart';
import 'package:my_shop/views/BarcodeScannerScreen.dart';

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
        title: Text(
          'Profile',
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

            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().ciHome,
              Routes().homeWithBottombar,
              (route) => false,
            );
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: PopScope(
        canPop: false,
        child: Column(
          children: [
            _buildHeader(),
            _buildMenuOptions(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.green],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage('assets/dp.jpg'),
        ),
        SizedBox(height: 10),
        Text(
          'Sarthak Chakraborty',
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
          leading: Icon(Icons.favorite, color: Colors.blue),
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
          leading: Icon(Icons.calendar_today, color: Colors.blue),
          title: Text(
            'Appointment',
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
          leading: Icon(Icons.payment, color: Colors.blue),
          title: Text(
            'Payment Method',
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
          leading: Icon(Icons.question_answer, color: Colors.blue),
          title: Text(
            'FAQs',
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
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes().loggedOut,
            //   (route) => false,
            // );
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
