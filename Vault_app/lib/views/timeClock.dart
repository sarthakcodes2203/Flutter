import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Timeclock extends StatefulWidget {
  String routeName = "/timeClock";
  Timeclock({super.key});

  @override
  State<Timeclock> createState() => _TimeclockState();
}

class _TimeclockState extends State<Timeclock>
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
          'Time Clock',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25,
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 322,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
            ),
            child: Center(
              child: Material(
                elevation: 10.0, // Adding elevation
                shape: CircleBorder(), // Maintaining circular shape
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.access_time,
                    size: 70,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/dp.jpg'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Derrick',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.cyan,
                              size: 18,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '7926 Old Blackburn Court\nLittleton, CO 80123',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.cyan),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.sync,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Handle sync action
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Time Logged',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '00 : 00 : 05',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Clock In action
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.cyan, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 51),
                  ),
                  child: Text(
                    'CLOCK IN',
                    style: TextStyle(fontSize: 18, color: Colors.cyan),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle Clock Out action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 230, 176, 68),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 51),
                  ),
                  child: Text(
                    'CLOCK OUT',
                    style: TextStyle(fontSize: 18, color: Colors.white),
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


