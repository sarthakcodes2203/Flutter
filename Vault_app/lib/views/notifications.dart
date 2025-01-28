import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Notifications extends StatefulWidget {
  String routeName = "/notifications";
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
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

  bool isRead = false;

  void _toggleReadStatus() {
    setState(() {
      isRead = !isRead;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'Notifications',
            // 'Edit Notes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
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
              // Routes().signUp,
              Routes().bottomBar,
              (route) => false,
              arguments: 2, // Pass the _selectedIndex value as an argument
            );
          },
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: _toggleReadStatus,
            child: Container(
              height: 123,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //Left-Right
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4.0,
                        height: double.infinity,
                        color: isRead
                            ? Colors.grey
                            : Colors.cyan, // Change color based on read status
                      ),
                      SizedBox(width: 8.0),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.cyan,
                        child: Icon(
                          FontAwesomeIcons.solidEnvelopeOpen,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Text(
                                      "Property Vault",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Flexible(flex: 1, child: Text('12:00AM'))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Hey this is a message"),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 123,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Left-Right
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 4.0,
                      height: double.infinity,
                      color: isRead
                          ? Colors.grey
                          : Colors.cyan, // Change color based on read status
                    ),
                    SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.cyan,
                      child: Icon(
                        FontAwesomeIcons.solidEnvelopeOpen,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: Text(
                                    "Property Vault",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                Flexible(flex: 1, child: Text('12:00AM'))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text("Hey this is a message"),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 123,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Left-Right
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 4.0,
                      height: double.infinity,
                      color: isRead
                          ? Colors.grey
                          : Colors.cyan, // Change color based on read status
                    ),
                    SizedBox(width: 8.0),
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.cyan,
                      child: Icon(
                        FontAwesomeIcons.solidEnvelopeOpen,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: Text(
                                    "Property Vault",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                                Flexible(flex: 1, child: Text('12:00AM'))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text("Hey this is a message"),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
