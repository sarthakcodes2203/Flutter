import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Account extends StatefulWidget {
  String routeName = "/account";
  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

int _currentIndex = 2;
bool _showLabels = false;

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Account',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {},
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
                borderRadius: BorderRadius.only(
                    // add circular borders to bottom
                    // bottomLeft: Radius.circular(45),
                    // bottomRight: Radius.circular(45),
                    ),
              ),
              // child: Column(
              //   children: [
              //     Container(
              //       height: 300,
              //       child: Center(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(
              //               FontAwesomeIcons.userLock,
              //               size: 50,
              //               color: Colors.white,
              //             ),
              //             SizedBox(
              //               height: 18,
              //             ),
              //             Text(
              //               'We have sent you an access code\n           via email verification',
              //               style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 18,
              //                 // height: 1,
              //                 // letterSpacing: 2,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     // add your other widgets here
              //   ],
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().profile,
                            (route) => false,
                          );
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/dp.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  Routes().profile,
                                  (route) => false,
                                );
                              },
                              child: Text(
                                'Sarthak Chakraborty',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.building,
                                    color: Colors.white, size: 12),
                                SizedBox(width: 3),
                                Text(
                                  'Property Name',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'Team Member',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ])
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().profile_Edit,
                            (route) => false,
                          );
                        },
                        icon: Icon(Icons.edit),
                        label: Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      // SizedBox(width: 10),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes().timeClock,
                            (route) => false,
                          );
                        },
                        icon: Icon(Icons.access_time),
                        label: Text('Time Clock'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 28, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(height: 6),

                // List of Options
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.gears,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().settings,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Notifications',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().notifications,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.filePen,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Notes',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().notes,
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().logIn,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   showUnselectedLabels: false,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       label: 'Calendar',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //       label: 'Account',
      //     ),
      //   ],
      // ),
    );
  }
}
