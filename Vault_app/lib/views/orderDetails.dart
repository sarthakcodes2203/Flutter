import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Orderdetails extends StatefulWidget {
  String routeName = "/orderDetails";
  Orderdetails({super.key});

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails>
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

  static const index = 0;
  Color _bottomAppBarColor = Colors.white;
  bool _jobStarted = false;

  void _StartJobPressed() {
    setState(() {
      _bottomAppBarColor = Colors.red;
      _jobStarted = true;
    });
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: GestureDetector(
                  onTap: _showReason,
                  child: Center(
                    child: Text(
                      'PENDING',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1),
              ListTile(
                title: GestureDetector(
                  onTap: _showReason,
                  child: Center(
                    child: Text(
                      'NOT COMPLETED',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                // onTap: _showReason,
              ),
              Divider(thickness: 1),
              ListTile(
                title: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // void _showReason() {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Scaffold(
  //         body: Padding(
  //           padding: const EdgeInsets.all(12),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     'Reason',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 21,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                   IconButton(
  //                     icon: Icon(FontAwesomeIcons.xmark, size: 23),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                   ),
  //                 ],
  //               ),
  //               Divider(thickness: 1),
  //               TextFormField(
  //                 minLines: 5,
  //                 maxLines: null,
  //                 decoration: InputDecoration(
  //                   hintText: 'Write something here..',
  //                   border: OutlineInputBorder(),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         bottomNavigationBar: BottomAppBar(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: ElevatedButton(
  //               onPressed: () {
  //                 // Handle submit action
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.cyan,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 padding: EdgeInsets.symmetric(vertical: 6),
  //               ),
  //               child: Text(
  //                 'Submit',
  //                 style: TextStyle(fontSize: 18, color: Colors.white),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  void _showReason() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reason',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.xmark, size: 23),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(thickness: 1),
              TextFormField(
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Write something here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16), // Add space between the form and the button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    // Routes().signUp,
                    Routes().workOrder,
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Order Detail',
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
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light Fitting',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '23th Jan 2020',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Property Name and Priority
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.building,
                      color: Colors.cyan,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Property name',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Priority',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 4),
                    PriorityTag(
                        status: index == 0 ? 'High' : 'Moderate',
                        color: index == 0 ? Colors.green : Colors.yellow),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    //   decoration: BoxDecoration(
                    //     color: Colors.green,
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   child: Text(
                    //     'High',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),

            // Address and Go to Map Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '702 Iscon Emporio, Jodhpur Cross Road, Satellite, Ahmedabad - 380015',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().location,
                      (route) => false,
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.mapLocationDot,
                    size: 18,
                  ),
                  label: Text('Go to map'),
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Assigned by Section
            RichText(
              text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                    text: 'Assigned by ',
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'Aditi Dhagat',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 12),

            // Description Section
            Text(
              'Description',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sit amet erat nec lacus interdum sollicitudin. Aenean mollis tellus ullamcorper, consequat est vel, eleifend urna. Vivamus non lacus nibh, quis varius ipsum. Duis in vulputate ipsum. Suspendisse feugiat nibh vel ligula lacinia maximus.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // color: _bottomAppBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                // onPressed: () {
                //   _StartJobPressed;
                // },
                onPressed: () {
                  if (_jobStarted) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().workOrder,
                      (route) => false,
                    );
                  } else {
                    _StartJobPressed();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _jobStarted ? Colors.green : Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _jobStarted ? 'COPLETE JOB' : 'START JOB',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            if (_jobStarted)
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: _showMenu,
                // onPressed: _showReason,
              ),
          ],
        ),
      ),
    );
  }
}

class PriorityTag extends StatelessWidget {
  final String status;
  final Color color;

  PriorityTag({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
