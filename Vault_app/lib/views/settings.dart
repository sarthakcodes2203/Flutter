import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Settings extends StatefulWidget {
  String routeName = "/settings";
  Settings({super.key});

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
        backgroundColor: Colors.cyan,
        title: Text(
          'Settings',
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
              // Routes().signUp,
              Routes().bottomBar,
              (route) => false,
                            arguments: 2, // Pass the _selectedIndex value as an argument

            );
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: Text('Terms & condition'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap here
                },
              ),
              Divider(),
              ListTile(
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap here
                },
              ),
              Divider(),
              ListTile(
                title: Text('Help!'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tap here
                },
              ),
            ],
          ),
        ),
    );
  }
}
