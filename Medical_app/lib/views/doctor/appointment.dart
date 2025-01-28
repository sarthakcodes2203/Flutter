import 'package:intl/intl.dart'; // For date formatting
import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/doctor/appointmentDone.dart';

class Appointment extends StatefulWidget {
  String routeName = "/appointment";

  // Appointment({super.key});

  final Map<String, String>? doctor;

  Appointment({Key? key, required this.doctor}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Map<String, String>? _doctorData;

  @override
  void initState() {
    super.initState();
    _textController.text = _reason;

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isEditing = false;
  TextEditingController _textController = TextEditingController();
  String _reason = 'Chest pain';

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        // Move the cursor to the end of the text
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _textController.selection = TextSelection.fromPosition(
            TextPosition(offset: _textController.text.length),
          );
        });
      } else {
        // Update the reason text
        _reason = _textController.text;
      }
    });
  }

  String _selectedDate = 'Wednesday, Mar 22, 2025 | 10:00 AM';

  Future<void> _showDateAndTimePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      // Format the selected date
      String formattedDate =
          DateFormat('EEEE, MMM d, yyyy').format(selectedDate);

      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Time',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Column(
                  children: [
                    _buildTimeOption('10:00 AM'),
                    _buildTimeOption('11:00 AM'),
                    _buildTimeOption('12:00 PM'),
                  ],
                ),
              ],
            ),
          );
        },
      ).whenComplete(() {
        // Update the selected date and time after the bottom sheet is closed
        setState(() {
          _selectedDate =
              '$formattedDate | 10:00 AM'; // Default time is 10:00 AM
        });
      });
    }
  }

  String _selectedPaymentMethod = 'VISA';

  void _showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'VISA',
            'MasterCard',
            'American Express',
            'PayPal',
            'Google Pay'
          ].map((method) {
            return ListTile(
              title: Text(method),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = method;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Appointment',
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
        body: PopScope(
          canPop: false,
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Container(
                  //   color: Colors.white,
                  //   height: 180,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(6.0),
                  //     child: Card(
                  //       color: Colors.white,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         side: BorderSide(
                  //             color: const Color.fromARGB(255, 176, 176, 176), width: 1),
                  //       ),
                  //       elevation: 2,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Container(
                  //             margin: EdgeInsets.only(left: 16),
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.circular(10.0),
                  //               child: Image.network(
                  //                 doctorData?["image"] ?? "",
                  //                 height: 100,
                  //                 width: 120,
                  //               ),
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Container(
                  //               margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     doctorData["name"] ?? "",
                  //                     style: TextStyle(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     doctorData["speciality"] ?? "",
                  //                     style: TextStyle(
                  //                       fontSize: 14,
                  //                       color: Colors.grey,
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 14,
                  //                   ),
                  //                   Container(
                  //                     width: 50,
                  //                     height: 22,
                  //                     decoration: BoxDecoration(
                  //                       border: Border.all(
                  //                           color:
                  //                               const Color.fromARGB(255, 158, 158, 158)),
                  //                       borderRadius: BorderRadius.circular(5.0),
                  //                     ),
                  //                     child: Row(
                  //                       children: [
                  //                         Icon(Icons.star,
                  //                             color: Color.fromRGBO(38, 43, 106, 1),
                  //                             size: 16),
                  //                         SizedBox(width: 4),
                  //                         Text(doctorData["rating"] ?? ""),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 7,
                  //                   ),
                  //                   Row(
                  //                     children: [
                  //                       Icon(
                  //                         Icons.location_on,
                  //                         size: 16,
                  //                         color: Colors.grey,
                  //                       ),
                  //                       SizedBox(width: 4),
                  //                       Text(
                  //                         doctorData["distance"] ?? "",
                  //                         style: TextStyle(
                  //                           fontSize: 14,
                  //                           color: Colors.grey,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                                child: Image.asset(
                                  'assets/doctors/top.jpeg',
                                  height: 100,
                                  width: 120,
                                ),
                                // child: Image.network(
                                //   _doctorData?["image"] ?? "",
                                //   height: 100,
                                //   width: 100,
                                // ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // _doctorData?["name"] ?? "",
                                      "Dr. Sarthak",

                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      // _doctorData?["speciality"] ?? "",
                                      "Cardiologist",

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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Color.fromRGBO(
                                                  38, 43, 106, 1),
                                              size: 16),
                                          SizedBox(width: 4),
                                          // Text(_doctorData?["rating"] ?? ""),
                                          Text("4.7"),
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
                                          // _doctorData?["distance"] ?? "",
                                          "800m away",

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
                  SizedBox(height: 10),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Date",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Change',
                  //       style: TextStyle(
                  //           fontSize: 17,
                  //           color: Color.fromRGBO(38, 43, 106, 1)),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //   Container(
                  //     decoration: BoxDecoration(
                  //       color: Color.fromRGBO(38, 43, 106, 1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Icon(
                  //         Icons.calendar_month_outlined,
                  //         color: Colors.grey[300],
                  //         size: 25,
                  //       ),
                  //     ),
                  //   ),
                  //   SizedBox(width: 12),
                  //   Text(
                  //     'Wednesday, Jun 23, 2021 | 10:00 AM',
                  //     style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                  //   ),
                  // ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: _showDateAndTimePicker,
                        child: Text(
                          'Change',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(38, 43, 106, 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(38, 43, 106, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.grey[300],
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        _selectedDate,
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    height: 2,
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "Reason",
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Change',
                  //       style: TextStyle(
                  //           fontSize: 17,
                  //           color: Color.fromRGBO(38, 43, 106, 1)),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 12,
                  // ),
                  // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  //   Container(
                  //     decoration: BoxDecoration(
                  //       color: Color.fromRGBO(38, 43, 106, 1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Icon(
                  //         Icons.note_add,
                  //         color: Colors.grey[300],
                  //         size: 25,
                  //       ),
                  //     ),
                  //   ),
                  //   SizedBox(width: 12),
                  //   Text(
                  //     'Chest pain',
                  //     style: TextStyle(fontSize: 17, color: Colors.black),
                  //   ),
                  // ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reason",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleEdit,
                        child: Text(
                          'Change',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(38, 43, 106, 1)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(38, 43, 106, 1),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.note_add,
                            color: Colors.grey[300],
                            size: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      _isEditing
                          ? Expanded(
                              child: TextField(
                                controller: _textController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                autofocus: true,
                              ),
                            )
                          : Text(
                              _reason,
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            ),
                    ],
                  ),

                  SizedBox(height: 8),
                  Divider(
                    height: 2,
                  ),

                  SizedBox(
                    height: 17,
                  ),
                  Text(
                    "Payment Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Consultation',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '\$60.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Admin Fee',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '\$01.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Aditional Discount',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '-',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$20.00',
                            style: TextStyle(
                              color: Color.fromRGBO(38, 43, 106, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 6),
                  Card(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedPaymentMethod,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(38, 43, 106, 1)),
                          ),
                          GestureDetector(
                            onTap: _showOptions,
                            child: Text(
                              'Change',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().appointmentDone,
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Booking",
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
          ),
        ));
  }

  Widget _buildTimeOption(String time) {
    return ListTile(
      title: Text(time, style: TextStyle(fontSize: 17)),
      onTap: () {
        Navigator.pop(context); // Close the bottom sheet
        setState(() {
          _selectedDate =
              _selectedDate.split('|').first + ' | $time'; // Update time
        });
      },
    );
  }
}








// import 'package:intl/intl.dart'; // For date formatting
// import 'package:flutter/material.dart';
// import 'package:my_app/routing/routes.dart';
// import 'package:my_app/views/doctor/appointmentDone.dart';

// class Appointment extends StatefulWidget {
//   String routeName = "/appointment";

//   Appointment({super.key});

//   // final Map<String, String>? doctorData;

//   // Appointment({Key? key, required this.doctorData}) : super(key: key);

//   @override
//   State<Appointment> createState() => _AppointmentState();
// }

// class _AppointmentState extends State<Appointment>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _textController.text = _reason;

//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   bool _isEditing = false;
//   TextEditingController _textController = TextEditingController();
//   String _reason = 'Chest pain';

//   void _toggleEdit() {
//     setState(() {
//       _isEditing = !_isEditing;
//       if (_isEditing) {
//         // Move the cursor to the end of the text
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           _textController.selection = TextSelection.fromPosition(
//             TextPosition(offset: _textController.text.length),
//           );
//         });
//       } else {
//         // Update the reason text
//         _reason = _textController.text;
//       }
//     });
//   }

//   String _selectedDate = 'Wednesday, Mar 22, 2025 | 10:00 AM';

//   Future<void> _showDateAndTimePicker() async {
//     DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (selectedDate != null) {
//       // Format the selected date
//       String formattedDate =
//           DateFormat('EEEE, MMM d, yyyy').format(selectedDate);

//       showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Select Time',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 12),
//                 Column(
//                   children: [
//                     _buildTimeOption('10:00 AM'),
//                     _buildTimeOption('11:00 AM'),
//                     _buildTimeOption('12:00 PM'),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ).whenComplete(() {
//         // Update the selected date and time after the bottom sheet is closed
//         setState(() {
//           _selectedDate =
//               '$formattedDate | 10:00 AM'; // Default time is 10:00 AM
//         });
//       });
//     }
//   }

//   String _selectedPaymentMethod = 'VISA';

//   void _showOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             'VISA',
//             'MasterCard',
//             'American Express',
//             'PayPal',
//             'Google Pay'
//           ].map((method) {
//             return ListTile(
//               title: Text(method),
//               onTap: () {
//                 setState(() {
//                   _selectedPaymentMethod = method;
//                 });
//                 Navigator.pop(context);
//               },
//             );
//           }).toList(),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Appointment',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
//           ),
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               // Navigator.pop(context);
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 // Routes().ciHome,
//                 Routes().doctorDetails,
//                 (route) => false,
//               );
//             },
//           ),
//           backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//         ),
//         body: PopScope(
//           canPop: false,
//           child: Container(
//             color: Colors.white,
//             child: SingleChildScrollView(
//               padding:
//                   EdgeInsets.only(top: 10, left: 20, right: 15, bottom: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //Container(
//                   //   color: Colors.white,
//                   //   height: 180,
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.all(6.0),
//                   //     child: Card(
//                   //       color: Colors.white,
//                   //       shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(10),
//                   //         side: BorderSide(
//                   //             color: const Color.fromARGB(255, 176, 176, 176), width: 1),
//                   //       ),
//                   //       elevation: 2,
//                   //       child: Row(
//                   //         mainAxisAlignment: MainAxisAlignment.start,
//                   //         crossAxisAlignment: CrossAxisAlignment.center,
//                   //         children: [
//                   //           Container(
//                   //             margin: EdgeInsets.only(left: 16),
//                   //             child: ClipRRect(
//                   //               borderRadius: BorderRadius.circular(10.0),
//                   //               child: Image.network(
//                   //                 doctorData?["image"] ?? "",
//                   //                 height: 100,
//                   //                 width: 120,
//                   //               ),
//                   //             ),
//                   //           ),
//                   //           Expanded(
//                   //             child: Container(
//                   //               margin: EdgeInsets.only(left: 15, right: 15, top: 20),
//                   //               child: Column(
//                   //                 mainAxisAlignment: MainAxisAlignment.start,
//                   //                 crossAxisAlignment: CrossAxisAlignment.start,
//                   //                 children: [
//                   //                   Text(
//                   //                     doctorData["name"] ?? "",
//                   //                     style: TextStyle(
//                   //                       fontSize: 18,
//                   //                       fontWeight: FontWeight.bold,
//                   //                     ),
//                   //                   ),
//                   //                   Text(
//                   //                     doctorData["speciality"] ?? "",
//                   //                     style: TextStyle(
//                   //                       fontSize: 14,
//                   //                       color: Colors.grey,
//                   //                     ),
//                   //                   ),
//                   //                   SizedBox(
//                   //                     height: 14,
//                   //                   ),
//                   //                   Container(
//                   //                     width: 50,
//                   //                     height: 22,
//                   //                     decoration: BoxDecoration(
//                   //                       border: Border.all(
//                   //                           color:
//                   //                               const Color.fromARGB(255, 158, 158, 158)),
//                   //                       borderRadius: BorderRadius.circular(5.0),
//                   //                     ),
//                   //                     child: Row(
//                   //                       children: [
//                   //                         Icon(Icons.star,
//                   //                             color: Color.fromRGBO(38, 43, 106, 1),
//                   //                             size: 16),
//                   //                         SizedBox(width: 4),
//                   //                         Text(doctorData["rating"] ?? ""),
//                   //                       ],
//                   //                     ),
//                   //                   ),
//                   //                   SizedBox(
//                   //                     height: 7,
//                   //                   ),
//                   //                   Row(
//                   //                     children: [
//                   //                       Icon(
//                   //                         Icons.location_on,
//                   //                         size: 16,
//                   //                         color: Colors.grey,
//                   //                       ),
//                   //                       SizedBox(width: 4),
//                   //                       Text(
//                   //                         doctorData["distance"] ?? "",
//                   //                         style: TextStyle(
//                   //                           fontSize: 14,
//                   //                           color: Colors.grey,
//                   //                         ),
//                   //                       ),
//                   //                     ],
//                   //                   )
//                   //                 ],
//                   //               ),
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   Container(
//                     color: Colors.white,
//                     height: 180,
//                     child: Padding(
//                       padding: const EdgeInsets.all(6.0),
//                       child: Card(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           side: BorderSide(
//                               color: const Color.fromARGB(255, 176, 176, 176),
//                               width: 1),
//                         ),
//                         elevation: 2,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(left: 16),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: Image.asset(
//                                   'assets/doctors/top.jpeg',
//                                   height: 100,
//                                   width: 120,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 margin: EdgeInsets.only(
//                                     left: 15, right: 15, top: 20),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Dr. Sarthak",
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "Cardiologist",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 14,
//                                     ),
//                                     Container(
//                                       width: 50,
//                                       height: 22,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: const Color.fromARGB(
//                                                 255, 158, 158, 158)),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           Icon(Icons.star,
//                                               color: Color.fromRGBO(
//                                                   38, 43, 106, 1),
//                                               size: 16),
//                                           SizedBox(width: 4),
//                                           Text("4.7"),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 7,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(
//                                           Icons.location_on,
//                                           size: 16,
//                                           color: Colors.grey,
//                                         ),
//                                         SizedBox(width: 4),
//                                         Text(
//                                           "800m away",
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Text(
//                   //       "Date",
//                   //       style: TextStyle(
//                   //         fontSize: 20,
//                   //         fontWeight: FontWeight.bold,
//                   //       ),
//                   //     ),
//                   //     Text(
//                   //       'Change',
//                   //       style: TextStyle(
//                   //           fontSize: 17,
//                   //           color: Color.fromRGBO(38, 43, 106, 1)),
//                   //     )
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 12,
//                   // ),
//                   // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                   //   Container(
//                   //     decoration: BoxDecoration(
//                   //       color: Color.fromRGBO(38, 43, 106, 1),
//                   //       shape: BoxShape.circle,
//                   //     ),
//                   //     child: Padding(
//                   //       padding: const EdgeInsets.all(8.0),
//                   //       child: Icon(
//                   //         Icons.calendar_month_outlined,
//                   //         color: Colors.grey[300],
//                   //         size: 25,
//                   //       ),
//                   //     ),
//                   //   ),
//                   //   SizedBox(width: 12),
//                   //   Text(
//                   //     'Wednesday, Jun 23, 2021 | 10:00 AM',
//                   //     style: TextStyle(fontSize: 17, color: Colors.grey[700]),
//                   //   ),
//                   // ]),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Date",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _showDateAndTimePicker,
//                         child: Text(
//                           'Change',
//                           style: TextStyle(
//                               fontSize: 17,
//                               color: Color.fromRGBO(38, 43, 106, 1)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromRGBO(38, 43, 106, 1),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.calendar_month_outlined,
//                             color: Colors.grey[300],
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       Text(
//                         _selectedDate,
//                         style: TextStyle(fontSize: 17, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),

//                   SizedBox(
//                     height: 8,
//                   ),
//                   Divider(
//                     height: 2,
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),

//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   children: [
//                   //     Text(
//                   //       "Reason",
//                   //       style: TextStyle(
//                   //         fontSize: 20,
//                   //         fontWeight: FontWeight.bold,
//                   //       ),
//                   //     ),
//                   //     Text(
//                   //       'Change',
//                   //       style: TextStyle(
//                   //           fontSize: 17,
//                   //           color: Color.fromRGBO(38, 43, 106, 1)),
//                   //     )
//                   //   ],
//                   // ),
//                   // SizedBox(
//                   //   height: 12,
//                   // ),
//                   // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                   //   Container(
//                   //     decoration: BoxDecoration(
//                   //       color: Color.fromRGBO(38, 43, 106, 1),
//                   //       shape: BoxShape.circle,
//                   //     ),
//                   //     child: Padding(
//                   //       padding: const EdgeInsets.all(8.0),
//                   //       child: Icon(
//                   //         Icons.note_add,
//                   //         color: Colors.grey[300],
//                   //         size: 25,
//                   //       ),
//                   //     ),
//                   //   ),
//                   //   SizedBox(width: 12),
//                   //   Text(
//                   //     'Chest pain',
//                   //     style: TextStyle(fontSize: 17, color: Colors.black),
//                   //   ),
//                   // ]),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Reason",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: _toggleEdit,
//                         child: Text(
//                           'Change',
//                           style: TextStyle(
//                               fontSize: 17,
//                               color: Color.fromRGBO(38, 43, 106, 1)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromRGBO(38, 43, 106, 1),
//                           shape: BoxShape.circle,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.note_add,
//                             color: Colors.grey[300],
//                             size: 25,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 12),
//                       _isEditing
//                           ? Expanded(
//                               child: TextField(
//                                 controller: _textController,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.zero,
//                                 ),
//                                 autofocus: true,
//                               ),
//                             )
//                           : Text(
//                               _reason,
//                               style:
//                                   TextStyle(fontSize: 17, color: Colors.black),
//                             ),
//                     ],
//                   ),

//                   SizedBox(height: 8),
//                   Divider(
//                     height: 2,
//                   ),

//                   SizedBox(
//                     height: 17,
//                   ),
//                   Text(
//                     "Payment Details",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),

//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Consultation',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           Text(
//                             '\$60.00',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 6),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Admin Fee',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           Text(
//                             '\$01.00',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 6),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Aditional Discount',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           Text(
//                             '-',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'TOTAL',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '\$20.00',
//                             style: TextStyle(
//                               color: Color.fromRGBO(38, 43, 106, 1),
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Divider(),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 17,
//                   ),
//                   Text(
//                     "Payment Method",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   // SizedBox(height: 6),
//                   Card(
//                     color: Colors.white,
//                     child: Container(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             _selectedPaymentMethod,
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromRGBO(38, 43, 106, 1)),
//                           ),
//                           GestureDetector(
//                             onTap: _showOptions,
//                             child: Text(
//                               'Change',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey[700],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 26,
//                   ),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           // Routes().ciHome,
//                           Routes().appointmentDone,
//                           (route) => false,
//                         );
//                       },
//                       child: Text(
//                         "Booking",
//                         style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//                           minimumSize: Size(double.infinity, 60),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(18))),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }

//   Widget _buildTimeOption(String time) {
//     return ListTile(
//       title: Text(time, style: TextStyle(fontSize: 17)),
//       onTap: () {
//         Navigator.pop(context); // Close the bottom sheet
//         setState(() {
//           _selectedDate =
//               _selectedDate.split('|').first + ' | $time'; // Update time
//         });
//       },
//     );
//   }
// }
