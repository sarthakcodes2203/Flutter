// import 'package:flutter/material.dart';
// import 'package:my_app/routing/routes.dart';

// class Doctordetails extends StatefulWidget {
//   String routeName = "/doctorDetails";

//   Doctordetails({super.key});

//   @override
//   State<Doctordetails> createState() => _DoctordetailsState();
// }

// class _DoctordetailsState extends State<Doctordetails>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   int currentIndex = 0;
//   List<String> dates = [
//     'Mon\n01',
//     'Tue\n02',
//     'Wed\n03',
//     'Thu\n04',
//     'Fri\n05',
//     'Sat\n06',
//     'Sun\n07',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//     Map<String, String>? _doctorData; // Add a variable to store the passed data

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Doctor Details',
//           style: TextStyle(
//               color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               // Routes().ciHome,
//               Routes().mainScreen,
//               (route) => false,
//             );
//             // Navigator.pop(context); // Go back to the previous screen
//           },
//         ),
//         backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(top: 15, left: 20, right: 15, bottom: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors.white,
//               height: 180,
//               child: Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Card(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(
//                         color: const Color.fromARGB(255, 176, 176, 176),
//                         width: 1), // Add this line
//                   ),
//                   elevation: 2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 16),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Image.asset(
//                             'assets/doctors/top.jpeg',
//                             height: 100,
//                             width: 120,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(left: 15, right: 15, top: 20),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Dr. Sarthak",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 "Cardiologist",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 14,
//                               ),
//                               Container(
//                                 width: 50,
//                                 height: 22,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color.fromARGB(
//                                           255, 158, 158, 158)),
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.star,
//                                         color: Color.fromRGBO(38, 43, 106, 1),
//                                         size: 16),
//                                     SizedBox(width: 4),
//                                     Text("4.7"),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on,
//                                     size: 16,
//                                     color: Colors.grey,
//                                   ),
//                                   SizedBox(width: 4),
//                                   Text(
//                                     "800m away",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),

//             Text('About',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),

//             RichText(
//               text: const TextSpan(
//                 text: '',
//                 style: TextStyle(color: Color(0xFF666666), fontSize: 16),
//                 children: [
//                   TextSpan(
//                     text:
//                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       // fontWeight: FontWeight.w500
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Read more',
//                     style: TextStyle(
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                       fontSize: 16,
//                       // fontWeight: FontWeight.w600,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30),

//             // Text('Available Slots',
//             //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

//             Container(
//               height: 90,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: dates.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(4),
//                       padding: EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: currentIndex == index
//                               ? Color.fromRGBO(38, 43, 106, 1)
//                               : Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(15),
//                         color: currentIndex == index
//                             ? Color.fromRGBO(38, 43, 106, 1)
//                             : Colors.white,
//                       ),
//                       child: Center(
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: dates[index].split('\n')[0],
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                   color: currentIndex == index
//                                       ? Colors.white
//                                       : Colors.grey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '\n',
//                               ),
//                               TextSpan(
//                                 text: dates[index].split('\n')[1],
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: currentIndex == index
//                                       ? Colors.white
//                                       : Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 15),

//             Divider(
//               height: 2,
//             ),
//             SizedBox(height: 15),

//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 Chip(
//                   label: Text(
//                     '09:00 AM',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 ),
//                 Chip(
//                   label: Text('09:00 AM'),
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),

//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                     context,
//                     // Routes().ciHome,
//                     Routes().appointment,
//                     (route) => false,
//                   );
//                 },
//                 child: Text(
//                   "Book Appointment",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//                     minimumSize: Size(double.infinity, 60),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Doctordetails extends StatefulWidget {
  String routeName = "/doctorDetails";

  Doctordetails({super.key, required Map<String, String> doctor});

  @override
  State<Doctordetails> createState() => _DoctordetailsState();
}

class _DoctordetailsState extends State<Doctordetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentIndex = 0;
  int currentIndex1 = 0;
  List<String> dates = [
    'Mon\n01',
    'Tue\n02',
    'Wed\n03',
    'Thu\n04',
    'Fri\n05',
    'Sat\n06',
    'Sun\n07',
  ];

  Map<String, String>? _doctorData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs is Map<String, String>) {
      _doctorData = routeArgs;
    }
  }

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
        title: Text(
          'Doctor Details',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().mainScreen,
              (route) => false,
            );
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15, left: 20, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 176, 176, 176),
                        width: 1),
                  ),
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            _doctorData?["image"] ?? "",
                            height: 100,
                            width: 120,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _doctorData?["name"] ?? "",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _doctorData?["speciality"] ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Container(
                                width: 50,
                                height: 22,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 158, 158, 158)),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Color.fromRGBO(38, 43, 106, 1),
                                        size: 16),
                                    SizedBox(width: 4),
                                    Text(_doctorData?["rating"] ?? ""),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    _doctorData?["distance"] ?? "",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: '',
                style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                children: [
                  TextSpan(
                    text: _doctorData?["about"] ?? "",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      // fontWeight: FontWeight.w500
                    ),
                  ),
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      color: Color.fromRGBO(38, 43, 106, 1),
                      fontSize: 16,
                      // fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            
            Text(
              'Available Slots',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(
                    38, 43, 106, 1), // Consistent color with your theme
              ),
            ),
            SizedBox(
                height: 10), // Adds spacing between the title and the slots
            Container(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              8), // Increased spacing for a clean layout
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: currentIndex == index
                              ? Color.fromRGBO(
                                  38, 43, 106, 1) // Highlighted border color
                              : Colors.grey.withOpacity(
                                  0.5), // Lighter border color when not selected
                        ),
                        borderRadius: BorderRadius.circular(
                            12), // Slightly rounded corners for a modern feel
                        color: currentIndex == index
                            ? Color.fromRGBO(38, 43, 106,
                                1) // Background color for selected item
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ], // Adds a subtle shadow effect for elevation
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: dates[index].split('\n')[0],
                                style: TextStyle(
                                  fontSize:
                                      14, // Slightly larger font for better readability
                                  fontWeight: FontWeight.bold,
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Colors.grey[
                                          700], // Dark grey for unselected items
                                ),
                              ),
                              TextSpan(
                                text: '\n',
                              ),
                              TextSpan(
                                text: dates[index].split('\n')[1],
                                style: TextStyle(
                                  fontSize: 16, // Larger font size for the date
                                  fontWeight: FontWeight.bold,
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Color.fromRGBO(38, 43, 106,
                                          1), // Color for unselected
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Divider(
              height: 2,
            ),
            SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex1 = 0;
                    });
                  },
                  child: Chip(
                    label: Text(
                      '09:00 AM',
                      // _doctorData?["avtime"] ?? "",

                      style: TextStyle(color: Colors.grey),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex1 = 1;
                    });
                  },
                  child: Chip(
                    label: Text('09:00 AM'
                        // _doctorData?["avtime"] ?? "",
                        ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ],
            ),

            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           currentIndex1 = 0;
            //         });
            //       },
            //       child: Container(
            //         margin: EdgeInsets.all(4),
            //         padding: EdgeInsets.all(14),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: currentIndex1 == 0
            //                 ? Color.fromRGBO(38, 43, 106, 1)
            //                 : Colors.grey,
            //           ),
            //           borderRadius: BorderRadius.circular(15),
            //           color: currentIndex1 == 0
            //               ? Color.fromRGBO(38, 43, 106, 1)
            //               : Colors.white,
            //         ),
            //         child: Center(
            //           child: RichText(
            //             text: TextSpan(
            //               children: [
            //                 TextSpan(
            //                   text: '09:00 AM',
            //                   style: TextStyle(
            //                     fontSize: 13,
            //                     fontWeight: FontWeight.bold,
            //                     color: currentIndex1 == 0
            //                         ? Colors.white
            //                         : Colors.grey,
            //                   ),
            //                 ),
            //                 TextSpan(
            //                   text: '\n',
            //                 ),
            //                 TextSpan(
            //                   text: '09:00 AM',
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                     color: currentIndex1 == 0
            //                         ? Colors.white
            //                         : Colors.black,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           currentIndex1 = 1;
            //         });
            //       },
            //       child: Container(
            //         margin: EdgeInsets.all(4),
            //         padding: EdgeInsets.all(14),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color: currentIndex1 == 1
            //                 ? Color.fromRGBO(38, 43, 106, 1)
            //                 : Colors.grey,
            //           ),
            //           borderRadius: BorderRadius.circular(15),
            //           color: currentIndex1 == 1
            //               ? Color.fromRGBO(38, 43, 106, 1)
            //               : Colors.white,
            //         ),
            //         child: Center(
            //           child: RichText(
            //             text: TextSpan(
            //               children: [
            //                 TextSpan(
            //                   text: '09:00 AM',
            //                   style: TextStyle(
            //                     fontSize: 13,
            //                     fontWeight: FontWeight.bold,
            //                     color: currentIndex == 1
            //                         ? Colors.white
            //                         : Colors.grey,
            //                   ),
            //                 ),
            //                 TextSpan(
            //                   text: '\n',
            //                 ),
            //                 TextSpan(
            //                   text: '09:00 AM',
            //                   style: TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                     color: currentIndex == 1
            //                         ? Colors.white
            //                         : Colors.black,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 16),

            SizedBox(height: 145),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes().appointment, // Third screen route
                    (route) => false,
                    arguments: _doctorData, // Pass the actual doctor's data
                  );
                },
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:my_app/routing/routes.dart';

// // class Doctordetails extends StatefulWidget {
// //   String routeName = "/doctorDetails";

// //   Doctordetails({super.key});

// //   @override
// //   State<Doctordetails> createState() => _DoctordetailsState();
// // }

// // class _DoctordetailsState extends State<Doctordetails>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   int currentIndex = 0;
// //   List<String> dates = [
// //     'Mon\n01',
// //     'Tue\n02',
// //     'Wed\n03',
// //     'Thu\n04',
// //     'Fri\n05',
// //     'Sat\n06',
// //     'Sun\n07',
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //     Map<String, String>? _doctorData; // Add a variable to store the passed data

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'Doctor Details',
// //           style: TextStyle(
// //               color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
// //         ),
// //         leading: IconButton(
// //           icon: Icon(
// //             Icons.arrow_back,
// //             color: Colors.white,
// //           ),
// //           onPressed: () {
// //             Navigator.pushNamedAndRemoveUntil(
// //               context,
// //               // Routes().ciHome,
// //               Routes().mainScreen,
// //               (route) => false,
// //             );
// //             // Navigator.pop(context); // Go back to the previous screen
// //           },
// //         ),
// //         backgroundColor: Color.fromRGBO(38, 43, 106, 1),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.only(top: 15, left: 20, right: 15, bottom: 15),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               color: Colors.white,
// //               height: 180,
// //               child: Padding(
// //                 padding: const EdgeInsets.all(6.0),
// //                 child: Card(
// //                   color: Colors.white,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                     side: BorderSide(
// //                         color: const Color.fromARGB(255, 176, 176, 176),
// //                         width: 1), // Add this line
// //                   ),
// //                   elevation: 2,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                       Container(
// //                         margin: EdgeInsets.only(left: 16),
// //                         child: ClipRRect(
// //                           borderRadius: BorderRadius.circular(10.0),
// //                           child: Image.asset(
// //                             'assets/doctors/top.jpeg',
// //                             height: 100,
// //                             width: 120,
// //                           ),
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: Container(
// //                           margin: EdgeInsets.only(left: 15, right: 15, top: 20),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.start,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 "Dr. Sarthak",
// //                                 style: TextStyle(
// //                                   fontSize: 18,
// //                                   fontWeight: FontWeight.bold,
// //                                 ),
// //                               ),
// //                               Text(
// //                                 "Cardiologist",
// //                                 style: TextStyle(
// //                                   fontSize: 14,
// //                                   color: Colors.grey,
// //                                 ),
// //                               ),
// //                               SizedBox(
// //                                 height: 14,
// //                               ),
// //                               Container(
// //                                 width: 50,
// //                                 height: 22,
// //                                 decoration: BoxDecoration(
// //                                   border: Border.all(
// //                                       color: const Color.fromARGB(
// //                                           255, 158, 158, 158)),
// //                                   borderRadius: BorderRadius.circular(5.0),
// //                                 ),
// //                                 child: Row(
// //                                   children: [
// //                                     Icon(Icons.star,
// //                                         color: Color.fromRGBO(38, 43, 106, 1),
// //                                         size: 16),
// //                                     SizedBox(width: 4),
// //                                     Text("4.7"),
// //                                   ],
// //                                 ),
// //                               ),
// //                               SizedBox(
// //                                 height: 7,
// //                               ),
// //                               Row(
// //                                 children: [
// //                                   Icon(
// //                                     Icons.location_on,
// //                                     size: 16,
// //                                     color: Colors.grey,
// //                                   ),
// //                                   SizedBox(width: 4),
// //                                   Text(
// //                                     "800m away",
// //                                     style: TextStyle(
// //                                       fontSize: 14,
// //                                       color: Colors.grey,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16),

// //             Text('About',
// //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //             SizedBox(height: 8),

// //             RichText(
// //               text: const TextSpan(
// //                 text: '',
// //                 style: TextStyle(color: Color(0xFF666666), fontSize: 16),
// //                 children: [
// //                   TextSpan(
// //                     text:
// //                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 14,
// //                       // fontWeight: FontWeight.w500
// //                     ),
// //                   ),
// //                   TextSpan(
// //                     text: 'Read more',
// //                     style: TextStyle(
// //                       color: Color.fromRGBO(38, 43, 106, 1),
// //                       fontSize: 16,
// //                       // fontWeight: FontWeight.w600,
// //                       decoration: TextDecoration.underline,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             SizedBox(height: 30),

// //             // Text('Available Slots',
// //             //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

// //             Container(
// //               height: 90,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 itemCount: dates.length,
// //                 itemBuilder: (context, index) {
// //                   return GestureDetector(
// //                     onTap: () {
// //                       setState(() {
// //                         currentIndex = index;
// //                       });
// //                     },
// //                     child: Container(
// //                       margin: EdgeInsets.all(4),
// //                       padding: EdgeInsets.all(14),
// //                       decoration: BoxDecoration(
// //                         border: Border.all(
// //                           color: currentIndex == index
// //                               ? Color.fromRGBO(38, 43, 106, 1)
// //                               : Colors.grey,
// //                         ),
// //                         borderRadius: BorderRadius.circular(15),
// //                         color: currentIndex == index
// //                             ? Color.fromRGBO(38, 43, 106, 1)
// //                             : Colors.white,
// //                       ),
// //                       child: Center(
// //                         child: RichText(
// //                           text: TextSpan(
// //                             children: [
// //                               TextSpan(
// //                                 text: dates[index].split('\n')[0],
// //                                 style: TextStyle(
// //                                   fontSize: 13,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: currentIndex == index
// //                                       ? Colors.white
// //                                       : Colors.grey,
// //                                 ),
// //                               ),
// //                               TextSpan(
// //                                 text: '\n',
// //                               ),
// //                               TextSpan(
// //                                 text: dates[index].split('\n')[1],
// //                                 style: TextStyle(
// //                                   fontSize: 18,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: currentIndex == index
// //                                       ? Colors.white
// //                                       : Colors.black,
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             SizedBox(height: 15),

// //             Divider(
// //               height: 2,
// //             ),
// //             SizedBox(height: 15),

// //             Wrap(
// //               spacing: 8,
// //               runSpacing: 8,
// //               children: [
// //                 Chip(
// //                   label: Text(
// //                     '09:00 AM',
// //                     style: TextStyle(color: Colors.grey),
// //                   ),
// //                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                 ),
// //                 Chip(
// //                   label: Text('09:00 AM'),
// //                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),

// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.pushNamedAndRemoveUntil(
// //                     context,
// //                     // Routes().ciHome,
// //                     Routes().appointment,
// //                     (route) => false,
// //                   );
// //                 },
// //                 child: Text(
// //                   "Book Appointment",
// //                   style: TextStyle(
// //                     fontSize: 20,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //                 style: ElevatedButton.styleFrom(
// //                     backgroundColor: Color.fromRGBO(38, 43, 106, 1),
// //                     minimumSize: Size(double.infinity, 60),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(18))),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:my_app/routing/routes.dart';

// class Doctordetails extends StatefulWidget {
//   String routeName = "/doctorDetails";

//   Doctordetails({super.key, required Map<String, String> doctor});

//   @override
//   State<Doctordetails> createState() => _DoctordetailsState();
// }

// class _DoctordetailsState extends State<Doctordetails>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   int currentIndex = 0;
//   int currentIndex1 = 0;
//   List<String> dates = [
//     'Mon\n01',
//     'Tue\n02',
//     'Wed\n03',
//     'Thu\n04',
//     'Fri\n05',
//     'Sat\n06',
//     'Sun\n07',
//   ];

//   Map<String, String>? _doctorData;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final routeArgs = ModalRoute.of(context)?.settings.arguments;
//     if (routeArgs is Map<String, String>) {
//       _doctorData = routeArgs;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Doctor Details',
//           style: TextStyle(
//               color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               Routes().mainScreen,
//               (route) => false,
//             );
//           },
//         ),
//         backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(top: 15, left: 20, right: 15, bottom: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               color: Colors.white,
//               height: 180,
//               child: Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: Card(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(
//                         color: const Color.fromARGB(255, 176, 176, 176),
//                         width: 1), // Add this line
//                   ),
//                   elevation: 2,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 16),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: Image.network(
//                             _doctorData?["image"] ?? "",
//                             height: 100,
//                             width: 120,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: EdgeInsets.only(left: 15, right: 15, top: 20),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 _doctorData?["name"] ?? "",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 _doctorData?["speciality"] ?? "",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 14,
//                               ),
//                               Container(
//                                 width: 50,
//                                 height: 22,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color.fromARGB(
//                                           255, 158, 158, 158)),
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.star,
//                                         color: Color.fromRGBO(38, 43, 106, 1),
//                                         size: 16),
//                                     SizedBox(width: 4),
//                                     Text(_doctorData?["rating"] ?? ""),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 7,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on,
//                                     size: 16,
//                                     color: Colors.grey,
//                                   ),
//                                   SizedBox(width: 4),
//                                   Text(
//                                     _doctorData?["distance"] ?? "",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'About',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             RichText(
//               text: TextSpan(
//                 text: '',
//                 style: TextStyle(color: Color(0xFF666666), fontSize: 16),
//                 children: [
//                   TextSpan(
//                     text: _doctorData?["about"] ?? "",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       // fontWeight: FontWeight.w500
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Read more',
//                     style: TextStyle(
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                       fontSize: 16,
//                       // fontWeight: FontWeight.w600,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 30),
//             Text('Available Slots',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Container(
//               height: 90,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: dates.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(4),
//                       padding: EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: currentIndex == index
//                               ? Color.fromRGBO(38, 43, 106, 1)
//                               : Colors.grey,
//                         ),
//                         borderRadius: BorderRadius.circular(15),
//                         color: currentIndex == index
//                             ? Color.fromRGBO(38, 43, 106, 1)
//                             : Colors.white,
//                       ),
//                       child: Center(
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: dates[index].split('\n')[0],
//                                 // text: _doctorData?["avdate"] ?? "",
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                   color: currentIndex == index
//                                       ? Colors.white
//                                       : Colors.grey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: '\n',
//                               ),
//                               TextSpan(
//                                 text: dates[index].split('\n')[1],
//                                 // text: _doctorData?["avdate"] ?? "",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: currentIndex == index
//                                       ? Colors.white
//                                       : Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 15),
//             Divider(
//               height: 2,
//             ),
//             SizedBox(height: 15),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       currentIndex1 = 0;
//                     });
//                   },
//                   child: Chip(
//                     label: Text(
//                       '09:00 AM',
//                       // _doctorData?["avtime"] ?? "",

//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       currentIndex1 = 1;
//                     });
//                   },
//                   child: Chip(
//                     label: Text('09:00 AM'
//                         // _doctorData?["avtime"] ?? "",
//                         ),
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   ),
//                 ),
//               ],
//             ),

//             // Wrap(
//             //   spacing: 8,
//             //   runSpacing: 8,
//             //   children: [
//             //     GestureDetector(
//             //       onTap: () {
//             //         setState(() {
//             //           currentIndex1 = 0;
//             //         });
//             //       },
//             //       child: Container(
//             //         margin: EdgeInsets.all(4),
//             //         padding: EdgeInsets.all(14),
//             //         decoration: BoxDecoration(
//             //           border: Border.all(
//             //             color: currentIndex1 == 0
//             //                 ? Color.fromRGBO(38, 43, 106, 1)
//             //                 : Colors.grey,
//             //           ),
//             //           borderRadius: BorderRadius.circular(15),
//             //           color: currentIndex1 == 0
//             //               ? Color.fromRGBO(38, 43, 106, 1)
//             //               : Colors.white,
//             //         ),
//             //         child: Center(
//             //           child: RichText(
//             //             text: TextSpan(
//             //               children: [
//             //                 TextSpan(
//             //                   text: '09:00 AM',
//             //                   style: TextStyle(
//             //                     fontSize: 13,
//             //                     fontWeight: FontWeight.bold,
//             //                     color: currentIndex1 == 0
//             //                         ? Colors.white
//             //                         : Colors.grey,
//             //                   ),
//             //                 ),
//             //                 TextSpan(
//             //                   text: '\n',
//             //                 ),
//             //                 TextSpan(
//             //                   text: '09:00 AM',
//             //                   style: TextStyle(
//             //                     fontSize: 18,
//             //                     fontWeight: FontWeight.bold,
//             //                     color: currentIndex1 == 0
//             //                         ? Colors.white
//             //                         : Colors.black,
//             //                   ),
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     GestureDetector(
//             //       onTap: () {
//             //         setState(() {
//             //           currentIndex1 = 1;
//             //         });
//             //       },
//             //       child: Container(
//             //         margin: EdgeInsets.all(4),
//             //         padding: EdgeInsets.all(14),
//             //         decoration: BoxDecoration(
//             //           border: Border.all(
//             //             color: currentIndex1 == 1
//             //                 ? Color.fromRGBO(38, 43, 106, 1)
//             //                 : Colors.grey,
//             //           ),
//             //           borderRadius: BorderRadius.circular(15),
//             //           color: currentIndex1 == 1
//             //               ? Color.fromRGBO(38, 43, 106, 1)
//             //               : Colors.white,
//             //         ),
//             //         child: Center(
//             //           child: RichText(
//             //             text: TextSpan(
//             //               children: [
//             //                 TextSpan(
//             //                   text: '09:00 AM',
//             //                   style: TextStyle(
//             //                     fontSize: 13,
//             //                     fontWeight: FontWeight.bold,
//             //                     color: currentIndex == 1
//             //                         ? Colors.white
//             //                         : Colors.grey,
//             //                   ),
//             //                 ),
//             //                 TextSpan(
//             //                   text: '\n',
//             //                 ),
//             //                 TextSpan(
//             //                   text: '09:00 AM',
//             //                   style: TextStyle(
//             //                     fontSize: 18,
//             //                     fontWeight: FontWeight.bold,
//             //                     color: currentIndex == 1
//             //                         ? Colors.white
//             //                         : Colors.black,
//             //                   ),
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             SizedBox(height: 16),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                     context,
//                     Routes().appointment, // Third screen route
//                     (route) => false,
//                     // arguments: _doctorData, // Pass the actual doctor's data
//                   );
//                 },
//                 child: Text(
//                   "Book Appointment",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//                     minimumSize: Size(double.infinity, 60),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
