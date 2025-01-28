import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/views/doctor/schedule.dart';
import 'package:my_app/views/homeScreen/home.dart';
import 'package:my_app/views/pharmacy/pharmacy.dart';
import 'package:my_app/views/profileScreen/profileScreen.dart';

class Mainscreen extends StatefulWidget {
  String routeName = "/mainScreen";
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);
  }

  @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    Pharmacy(),
    Schedule(),
    Profilescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        child: _pages[_selectedIndex],
        canPop: false,
        onPopInvoked: (didPop) {
          if (_selectedIndex == 0)
            SystemNavigator.pop();
          else
            setState(() {
              _selectedIndex = 0;
            });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0
                    ? Color.fromRGBO(38, 43, 106, 1)
                    : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy,
                color: _selectedIndex == 1
                    ? Color.fromRGBO(38, 43, 106, 1)
                    : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today,
                color: _selectedIndex == 2
                    ? Color.fromRGBO(38, 43, 106, 1)
                    : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 3
                    ? Color.fromRGBO(38, 43, 106, 1)
                    : Colors.grey),
            label: '',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // switch (index) {
    //   case 0:
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       // Routes().ciHome,
    //       Routes().homeScreen,
    //       (route) => false,
    //     );
    //     break;
    //   case 1:
    //     // Navigate to a different screen
    //     break;
    //   case 2:
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       // Routes().ciHome,
    //       Routes().schedule,
    //       (route) => false,
    //     );
    //     break;
    //   case 3:
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       // Routes().ciHome,
    //       Routes().profileScreen,
    //       (route) => false,
    //     );
    //     break;
    // }
  }
}
