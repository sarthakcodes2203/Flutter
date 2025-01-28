import 'dart:async';

import 'package:Accountings/routes/routes.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});
  String routeName = "/mainPage";

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage>
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

  String _selectedAlphabet = '';
  Timer? _timer;
  bool _yearly = false;
  bool _monthly = false;
  bool _weekly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().ciHome,
              Routes().settings,
              (route) => false,
            );

            // Add your back button functionality here
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                // const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 43),
                const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 20, // Size of the avatar (optional)
                      backgroundImage:
                          AssetImage('assets/dp.jpg'), // Image from assets
                      backgroundColor:
                          Colors.transparent, // Optional background color
                    ),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                // Routes().ciHome,
                                Routes().notifications,
                                (route) => false,
                              );
                            },
                            child: Icon(Icons.notifications, size: 28)),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                            onTap: _showFilterDialog,
                            child: Icon(
                              Icons.menu,
                              size: 28,
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      // Routes().ciHome,
                      Routes().formDetailsFillUp,
                      (route) => false,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Column(
                      children: [
                        // Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mandeep Biyani',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '\$200',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Text(
                              '10 Days',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    children: [
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mandeep Biyani',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '\$200',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            '10 Days',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Column(
                    children: [
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mandeep Biyani',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '\$200',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text(
                            '10 Days',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 140,
            child: Row(
              children: [
                if (_selectedAlphabet.isNotEmpty)
                  Text(
                    _selectedAlphabet,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 158, 158, 158),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      for (var i = 65; i <= 90; i++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAlphabet = String.fromCharCode(i);
                              _startTimer();
                            });
                          },
                          child: Text(
                            String.fromCharCode(i),
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your code here to handle the button press
          Navigator.pushNamedAndRemoveUntil(
            context,
            // Routes().ciHome,
            Routes().formFillUp,
            (route) => false,
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              width: 42,
              height: 42,
            ),
            Icon(Icons.add, size: 32, color: Colors.white),
          ],
        ),
        tooltip: 'Add',
        backgroundColor: const Color.fromARGB(210, 121, 85, 72),
        shape: CircleBorder(), // Make the button round
      ),
    );
  }

  void _startTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(seconds: 2), () {
      setState(() {
        _selectedAlphabet = '';
      });
    });
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              SizedBox(width: 12),
              Text(
                'Filter',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Divider()
            ],
          ),
          // content: Row(
          //   children: [],
          // ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Yearly',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Checkbox(
                      value: _yearly,
                      onChanged: (bool? value) {
                        print('Checkbox clicked: $value');
                        setState(() {
                          _yearly = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(width: 16), // Add some space between the checkboxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Monthly',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Checkbox(
                        value: _monthly,
                        onChanged: (bool? value) => setState(() => _monthly = true)),
                  ],
                ),
                SizedBox(width: 16), // Add some space between the checkboxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Weekly',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Checkbox(
                        value: _weekly,
                        onChanged: (bool? value) => setState(() => _weekly = true)),
                  ],
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    minimumSize: Size(45, 34),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
          ],
        );
      },
    );
  }
}
