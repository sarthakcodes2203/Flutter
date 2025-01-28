import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:todo_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/views/logIn/logIn.dart';
import 'package:todo_app/views/screenS/profileUpdate.dart';
import 'package:todo_app/views/screenS/profileUserManagement.dart';

class Profile extends StatefulWidget {
  Profile({super.key});
  String routeName = "/profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
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
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes().profileUserManagement,
                        (route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 88,
                              height: 88,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      image: AssetImage('assets/dp.jpg'))),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey),
                                child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sarthak Chakraborty',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color:
                                      const Color.fromARGB(255, 113, 112, 112),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'sarthak@gmail.com',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Personal Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 22),
                  _buildDataField(Icons.person, 'Sarthak Chakraborty'),
                  SizedBox(height: 18),
                  _buildDataField(Icons.location_city, 'Durgapur'),
                  SizedBox(height: 18),
                  _buildDataField(Icons.phone, '+91 0123456789'),
                  // SizedBox(height: 16),
                  // _buildDataField(Icons.email, 'Email'),
                  SizedBox(height: 22),
                  ProfileMenuWidget(
                      title: "Settings",
                      icon: LineAwesomeIcons.cog,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "Billing Details",
                      icon: LineAwesomeIcons.wallet,
                      onPress: () {}),
                  ProfileMenuWidget(
                      title: "User Management",
                      icon: LineAwesomeIcons.user_check,
                      onPress: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ProfileMenuWidget(
                      title: "Information",
                      icon: LineAwesomeIcons.info,
                      onPress: () {}),
                  ProfileMenuWidget(
                    title: "Logout",
                    icon: LineAwesomeIcons.alternate_sign_out,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: LogoutDialogContent(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          );
                        },
                      );
                      // Get.defaultDialog(
                      //   title: "LOGOUT",
                      //   titleStyle: const TextStyle(fontSize: 20),
                      //   content: const Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 15.0),
                      //     child: Text("Are you sure you want to Logout?"),
                      //   ),
                      //   confirm: ElevatedButton(
                      //     onPressed: () {
                      //       // Close the dialog first, then navigate to Login
                      //       Get.back();
                      //       Get.to(() => Login());
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.redAccent,
                      //       side: BorderSide.none,
                      //     ),
                      //     child: const Text("Yes"),
                      //   ),
                      //   cancel: OutlinedButton(
                      //     onPressed: () =>
                      //         Get.back(), // Close dialog without navigating
                      //     child: const Text("No"),
                      //   ),
                      // );
                    },
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().profileUpdate,
                          (route) => false,
                        );
                        // Get.offAllNamed(Routes().profileUserManagement);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: const Color.fromARGB(255, 123, 123, 123),
                      ),
                      label: Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataField(IconData icon, String data) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(width: 16),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
          ),
          child: Text(
            data,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        )),
      ],
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var iconColor = Colors.grey;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

class LogoutDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "LOGOUT",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text("Are you sure you want to Logout?"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  // Routes().ciHome,
                  Routes().logIn,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                side: BorderSide.none,
              ),
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.black),
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: const Text("No", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ],
    );
  }
}
