import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Appointmentdone extends StatefulWidget {
  String routeName = "/appointmentDone";

  Appointmentdone({super.key});

  @override
  State<Appointmentdone> createState() => _AppointmentdoneState();
}

class _AppointmentdoneState extends State<Appointmentdone>
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
              // Routes().ciHome,
              Routes().doctorDetails,
              (route) => false,
            );
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.1,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 15, bottom: 15),
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
                                  child: Image.asset(
                                    'assets/doctors/top.jpeg',
                                    height: 100,
                                    width: 120,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Dr. Sarthak",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
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
                        Text(
                          'Change',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(38, 43, 106, 1)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                        'Wednesday, Jun 23, 2021 | 10:00 AM',
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                    ]),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 2,
                    ),
                    SizedBox(
                      height: 12,
                    ),
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
                        Text(
                          'Change',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(38, 43, 106, 1)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                      Text(
                        'Chest pain',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ]),
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
                              'VISA',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(38, 43, 106, 1)),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                  // decoration: TextDecoration.underline,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Appointmentdone()),
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
          ),
          Center(
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Icon(
                      Icons.check_circle,
                      color: Color.fromRGBO(51, 56, 124, 0.949),
                      size: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Payment Success",
                      style: TextStyle(
                        fontSize: 20,
                        // color: Color.fromRGBO(38, 43, 106, 1),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Your payment has been successful, you can have a consultation session with your trusted doctor",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 35),
                    ElevatedButton(
                      onPressed: () {
                                              Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().schedule,
                        (route) => false,
                      );


                      },
                      child: Text(
                        "View Schedule",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                        minimumSize: Size(120, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
