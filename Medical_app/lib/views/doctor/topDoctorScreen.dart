import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Topdoctorscreen extends StatefulWidget {
  String routeName = "/topDoctorScreen";

  Topdoctorscreen({super.key});

  @override
  State<Topdoctorscreen> createState() => _TopdoctorscreenState();
}

class _TopdoctorscreenState extends State<Topdoctorscreen>
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

  final List<Map<String, String>> topDoctors = [
    {
      "id": "1",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.5E3k8BOOi0Ux4PfseLWSfAHaE8&pid=Api&P=0&h=220",
      "name": "Dr. Sarthak",
      "speciality": "Cardiologist",
      "rating": "4.7",
      "distance": "800m away",
      "about":
          "Dr. Sarthak is a highly experienced cardiologist with over 15 years of experience in treating heart conditions. He is known for his compassionate care and cutting-edge treatment methods.",
      "availability": "Sep 5, 2024 - 10:00 AM to 2:00 PM",
      "avdate": "Sep 5 \n 2024",
      "avdtime": "10:00 AM to 2:00 PM"
    },
    {
      "id": "2",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.0fRsq6rCLtI974jJ3lEe2QHaG9&pid=Api&P=0&h=220",
      "name": "Dr. Priya Sharma",
      "speciality": "Dermatologist",
      "rating": "4.8",
      "distance": "1.2km away",
      "about":
          "Dr. Priya Sharma is a renowned dermatologist specializing in skin care and cosmetic treatments. With over 10 years of experience, she provides personalized care for all skin types.",
      "availability": "Sep 5, 2024 - 11:00 AM to 3:00 PM",
      "avdate": "Sep 5 \n 2024",
      "avtime": "10:00 AM to 2:00 PM"
    },
    {
      "id": "3",
      "image":
          "https://tse3.mm.bing.net/th?id=OIP.0Ttue7YQAsl2DKGwh4POzgHaHa&pid=Api&P=0&h=220",
      "name": "Dr. Anil Mehta",
      "speciality": "Pediatrician",
      "rating": "4.6",
      "distance": "600m away",
      "about":
          "Dr. Anil Mehta is a trusted pediatrician who has been caring for children for over 20 years. He is dedicated to ensuring the health and well-being of his young patients.",
      "availability": "Sep 5, 2024 - 9:00 AM to 1:00 PM",
      "avdate": "Sep 5 \n 2024",
      "avdtime": "10:00 AM to 2:00 PM"
    },
    {
      "id": "4",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP._3v_3-C1nlzO0GHLUGQQ1gHaHa&pid=Api&P=0&h=220",
      "name": "Dr. Kavita Rao",
      "speciality": "Gynecologist",
      "rating": "4.9",
      "distance": "950m away",
      "about":
          "Dr. Kavita Rao is an expert gynecologist with extensive experience in women's health. She offers comprehensive care for a wide range of gynecological conditions.",
      "availability": "Sep 5, 2024 - 1:00 PM to 5:00 PM",
      "avdate": "Sep 5 \n 2024",
      "avdtime": "10:00 AM to 2:00 PM"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Doctors',
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
              Routes().homeScreen,
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
          child: ListView(
            children: [
              ...topDoctors.map((doctor) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      // Routes().ciHome,
                      Routes().doctorDetails,
                      (route) => false,
                      arguments:
                          doctor, // Pass the doctor's data as an argument
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: const Color.fromARGB(255, 176, 176, 176),
                            width: 1,
                          ),
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
                                  doctor['image']!,
                                  height: 100,
                                  width: 120,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 16, top: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctor['name']!,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      doctor['speciality']!,
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
                                              255, 158, 158, 158),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color:
                                                Color.fromRGBO(38, 43, 106, 1),
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(doctor['rating']!),
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
                                          doctor['distance']!,
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
                );
              }),
            ],
          ),
        ),
      ),
    );

    //GestureDetector(
    //           onTap: () {
    //             Navigator.pushNamedAndRemoveUntil(
    //               context,
    //               // Routes().ciHome,
    //               Routes().doctorDetails,
    //               (route) => false,
    //             );
    //           },
    //           child: Container(
    //             color: Colors.white,
    //             height: 180,
    //             child: Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   side: BorderSide(
    //                       color: const Color.fromARGB(255, 176, 176, 176),
    //                       width: 1), // Add this line
    //                 ),
    //                 elevation: 2,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Container(
    //                       margin: EdgeInsets.only(left: 16),
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(10.0),
    //                         child: Image.asset(
    //                           'assets/doctors/top.jpeg',
    //                           height: 100,
    //                           width: 120,
    //                         ),
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Container(
    //                         margin: EdgeInsets.only(
    //                             left: 15, right: 16, top: 12),
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                               "Dr. Sarthak",
    //                               style: TextStyle(
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                             Text(
    //                               "Cardiologist",
    //                               style: TextStyle(
    //                                 fontSize: 14,
    //                                 color: Colors.grey,
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 14,
    //                             ),
    //                             Container(
    //                               width: 50,
    //                               height: 22,
    //                               decoration: BoxDecoration(
    //                                 border: Border.all(
    //                                     color: const Color.fromARGB(
    //                                         255, 158, 158, 158)),
    //                                 borderRadius:
    //                                     BorderRadius.circular(5.0),
    //                               ),
    //                               child: Row(
    //                                 children: [
    //                                   Icon(Icons.star,
    //                                       color: Color.fromRGBO(
    //                                           38, 43, 106, 1),
    //                                       size: 16),
    //                                   SizedBox(width: 4),
    //                                   Text("4.7"),
    //                                 ],
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 7,
    //                             ),
    //                             Row(
    //                               children: [
    //                                 Icon(
    //                                   Icons.location_on,
    //                                   size: 16,
    //                                   color: Colors.grey,
    //                                 ),
    //                                 SizedBox(width: 4),
    //                                 Text(
    //                                   "800m away",
    //                                   style: TextStyle(
    //                                     fontSize: 14,
    //                                     color: Colors.grey,
    //                                   ),
    //                                 ),
    //                               ],
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
  }
}
