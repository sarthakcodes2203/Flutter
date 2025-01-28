import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Schedule extends StatefulWidget {
  String routeName = "/schedule";

  Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule>
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

  int currentIndex = 0;

  final List<Map<String, String>> upcomingAppointments = [
    // Sample upcoming appointment data
    {
      "doctorName": "Dr. Sarthak",
      "specialty": "Cardiologist",
      "date": "01/08/2024",
      "time": "10:30 AM",
      "status": "Confirmed",
      "image": "https://tse4.mm.bing.net/th?id=OIP.CvzeD2SJpvyRh8L1Bk0TWwHaH6&pid=Api&P=0&h=220",
    },
    // Add more upcoming appointments
  ];

  final List<Map<String, String>> completedAppointments = [
    // Sample completed appointment data
    {
      "doctorName": "Dr. Jane",
      "specialty": "Dentist",
      "date": "15/09/2024",
      "time": "11:00 AM",
      "status": "Confirmed",
      "image": "https://tse4.mm.bing.net/th?id=OIP.FiHtVKXWu274mezrEiSh7gHaH0&pid=Api&P=0&h=220",
    },
    {
      "doctorName": "Dr. Thomas",
      "specialty": "Orthopedic",
      "date": "15/09/2024",
      "time": "11:00 AM",
      "status": "Confirmed",
      "image": "https://tse3.mm.bing.net/th?id=OIP.S-_8xIzSRHlvSpn0nxWDGwHaFb&pid=Api&P=0&h=220",
    },
    // Add more completed appointments
  ];

  final List<Map<String, String>> cancelledAppointments = [
    // Sample cancelled appointment data
    {
      "doctorName": "Dr. Lee",
      "specialty": "Surgeon",
      "date": "20/09/2024",
      "time": "09:30 AM",
      "status": "Cancelled",
      "image": "https://tse4.mm.bing.net/th?id=OIP.MUEhGSHvlJrHinZMfogqjQHaHa&pid=Api&P=0&h=220",
    },
    // Add more cancelled appointments
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAppointments;
    switch (currentIndex) {
      case 0:
        filteredAppointments = upcomingAppointments;
        break;
      case 1:
        filteredAppointments = completedAppointments;
        break;
      case 2:
        filteredAppointments = cancelledAppointments;
        break;
      default:
        filteredAppointments = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule',
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 2, right: 2, bottom: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatusButton('Upcoming', 0),
                    _buildStatusButton('Completed', 1),
                    _buildStatusButton('Cancelled', 2),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 2, left: 8, right: 8, bottom: 12),
                child: Column(
                  children: filteredAppointments
                      .map((appointment) => _buildAppointmentCard(appointment))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton(String label, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          color: currentIndex == index ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: currentIndex == index
            ? Color.fromRGBO(38, 43, 106, 1)
            : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(Map<String, String> appointment) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment["doctorName"]!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      appointment["specialty"]!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(appointment["image"]!),
                  radius: 35,
                ),
              ],
            ),
            SizedBox(height: 22),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.date_range_outlined,
                color: Colors.grey[700],
              ),
              SizedBox(width: 3),
              Text(
                appointment["date"]!,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(width: 11),
              Icon(
                Icons.timer,
                color: Colors.grey[700],
              ),
              SizedBox(width: 2),
              Text(
                appointment["time"]!,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(width: 14),
              Icon(
                appointment["status"]! == 'Confirmed'
                    ? Icons.grade_rounded
                    : Icons.grade_outlined,
                color: appointment["status"]! == 'Confirmed'
                    ? Colors.green
                    : Colors.red,
              ),
              SizedBox(width: 3),
              Text(
                appointment["status"]!,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ]),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(width: 23),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().doctorDetails,
                      (route) => false,
                    );
                  },
                  child: Text(
                    'Reschedule',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
