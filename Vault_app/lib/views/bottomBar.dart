import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/views/account.dart';
import 'package:pro_vault/views/calendar.dart';
import 'package:pro_vault/views/workOrder.dart';

class Bottombar extends StatefulWidget {
  String routeName = "/bottomBar";
  Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar>
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

  int _selectedIndex = 0;
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the _selectedIndex value from the route arguments
    final args = ModalRoute.of(context)?.settings.arguments as int?;
    if (args != null) {
      setState(() {
        _selectedIndex = args;
      });
    }
  }

  final List<Widget> _pages = [
    Workorder(),
    Calendar(),
    Account(),
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
            icon: Icon(Icons.home,size: 26,
                color: _selectedIndex == 0 ? Colors.cyan : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarDay,size: 21,
                color: _selectedIndex == 1 ? Colors.cyan : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,size: 26,
                color: _selectedIndex == 2 ? Colors.cyan : Colors.grey),
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



// class Bottombar extends StatefulWidget {
//   final int initialIndex;

//   Bottombar({super.key, this.initialIndex = 0});

//   @override
//   State<Bottombar> createState() => _BottombarState();
// }

// class _BottombarState extends State<Bottombar> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late int _selectedIndex;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//     _selectedIndex = widget.initialIndex;
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   final List<Widget> _pages = [
//     Workorder(),
//     Calendar(),
//     Account(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         title: Text(
//           'Time Clock',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//             fontSize: 25,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             FontAwesomeIcons.arrowLeft,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               '/bottomBar',
//               (route) => false,
//               arguments: 2, // Pass the index as an argument
//             );
//           },
//         ),
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               size: 26,
//               color: _selectedIndex == 0 ? Colors.cyan : Colors.grey,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               FontAwesomeIcons.calendarDay,
//               size: 21,
//               color: _selectedIndex == 1 ? Colors.cyan : Colors.grey,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.account_circle,
//               size: 26,
//               color: _selectedIndex == 2 ? Colors.cyan : Colors.grey,
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }
