import 'package:todo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  Settings({super.key});
  String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
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
              Routes().mainPage,
              (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Settings',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Divider(),
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
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              // Routes().ciHome,
                              Routes().profile,
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.brown,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              // Routes().ciHome,
                              Routes().changePassword,
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.lock, color: Colors.white, size: 40),
                                SizedBox(height: 10),
                                Text('Password',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Container(
                    //       width: 140,
                    //       height: 120,
                    //       decoration: BoxDecoration(
                    //         color: Colors.brown,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(Icons.g_translate,
                    //               color: Colors.white, size: 40),
                    //           SizedBox(height: 10),
                    //           Text('Language',
                    //               style: TextStyle(
                    //                   color: Colors.white, fontSize: 16)),
                    //         ],
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         // Navigator.pushNamedAndRemoveUntil(
                    //         //   context,
                    //         //   // Routes().ciHome,
                    //         //   Routes().formFillUp,
                    //         //   (route) => false,
                    //         // );
                    //       },
                    //       child: Container(
                    //         width: 140,
                    //         height: 120,
                    //         decoration: BoxDecoration(
                    //           color: Colors.brown,
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Icon(Icons.new_label,
                    //                 color: Colors.white, size: 40),
                    //             SizedBox(height: 10),
                    //             Text('New Entry',
                    //                 style: TextStyle(
                    //                     color: Colors.white, fontSize: 16)),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: _showLogoutDialog,
                          child: Container(
                            width: 140,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout,
                                    color: Colors.red, size: 40),
                                SizedBox(height: 10),
                                Text('Logout',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
                          Routes().logIn,
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
