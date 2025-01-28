import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shop/views/UiEditor.dart';
import 'package:my_shop/views/orderDetails.dart';
import 'package:my_shop/views/cartList.dart';
import 'package:my_shop/views/home.dart';
import 'package:my_shop/views/profile.dart';

class Homewithbottombar extends StatefulWidget {
      String routeName = "/homeWithBottombar";
 Homewithbottombar({super.key});

  @override
  State<Homewithbottombar> createState() => _HomewithbottombarState();
}

class _HomewithbottombarState extends State<Homewithbottombar>
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
    Home(),
    Cartlist(),
    // Bars(),
    Profile(),
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
            icon: Icon(FontAwesomeIcons.house,size: 22,
                color: _selectedIndex == 0 ? Colors.cyan : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cartShopping,size: 22,
                color: _selectedIndex == 1 ? Colors.cyan : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mobileScreen,size: 22,
                color: _selectedIndex == 2 ? Colors.cyan : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user,size: 22,
                color: _selectedIndex == 3 ? Colors.cyan : Colors.grey),
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

  }
}


