import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/cardiologist.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/covid19.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/general.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/psychiatrist.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/surgeon.dart';

class Dentist extends StatefulWidget {
  const Dentist({super.key});

  @override
  State<Dentist> createState() => _DentistState();
}

class _DentistState extends State<Dentist> with SingleTickerProviderStateMixin {
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

  bool _isCategoryVisible = false;
  List<String> _categories = [
    'General',
    'Dentist',
    'Psychiatrist',
    'Covid-19',
    'Surgeon',
    'Cardiologist',
  ];

  String? _selectedCategory;
final List<Map<String, String>> dentists = [
  {
    "id": "1",
    "image":
        "https://tse2.mm.bing.net/th?id=OIP.tGllZDBfTJ6oUe6U1IubrgHaI2&pid=Api&P=0&h=220",
    "name": "Dr. Rohan Gupta",
    "speciality": "Dentist",
    "rating": "4.7",
    "distance": "850m away",
    "about":
        "Dr. Rohan Gupta is a highly experienced dentist, specializing in cosmetic and restorative dentistry. He has been providing excellent care for over 10 years.",
    "availability": "Sep 7, 2024 - 9:00 AM to 2:00 PM",
    "avdate": "Sep 7 \n 2024",
    "avdtime": "9:00 AM to 2:00 PM"
  },
  {
    "id": "2",
    "image":
        "https://tse4.mm.bing.net/th?id=OIP.D7Ol7Nzc4HHpoZTBVhIO0AHaFX&pid=Api&P=0&h=220",
    "name": "Dr. Kavya Menon",
    "speciality": "Dentist",
    "rating": "4.9",
    "distance": "1.5km away",
    "about":
        "Dr. Kavya Menon is a skilled dentist with expertise in orthodontics and pediatric dental care. She is known for her gentle approach and exceptional treatment results.",
    "availability": "Sep 7, 2024 - 10:00 AM to 4:00 PM",
    "avdate": "Sep 7 \n 2024",
    "avdtime": "10:00 AM to 4:00 PM"
  },
  {
    "id": "3",
    "image":
        "https://tse1.mm.bing.net/th?id=OIP.xyPSuULudWc2yHMzS6vTaAHaD5&pid=Api&P=0&h=220",
    "name": "Dr. Ayesha Singh",
    "speciality": "Dentist",
    "rating": "4.8",
    "distance": "650m away",
    "about":
        "Dr. Ayesha Singh is a trusted dentist specializing in root canal treatments and preventive care. She has been practicing for over 8 years and is known for her patient-centric care.",
    "availability": "Sep 7, 2024 - 8:00 AM to 1:00 PM",
    "avdate": "Sep 7 \n 2024",
    "avdtime": "8:00 AM to 1:00 PM"
  },
  {
    "id": "4",
    "image":
        "https://tse3.mm.bing.net/th?id=OIP.VJTBrEkTyYQJMu5PfcVKygHaHa&pid=Api&P=0&h=220",
    "name": "Dr. Rahul Deshmukh",
    "speciality": "Dentist",
    "rating": "4.6",
    "distance": "900m away",
    "about":
        "Dr. Rahul Deshmukh is a well-known dentist with expertise in dental implants and cosmetic surgery. He has been delivering high-quality dental care for over 12 years.",
    "availability": "Sep 7, 2024 - 11:00 AM to 3:00 PM",
    "avdate": "Sep 7 \n 2024",
    "avdtime": "11:00 AM to 3:00 PM"
  }
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dentist',
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
              Routes().findDoctorsScreen,
              (route) => false,
            );
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 34),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find a doctor',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey), // Set border color to grey

                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromRGBO(38, 43, 106, 1),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0), // Adjust the vertical padding
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          _isCategoryVisible
                              ? Icons.arrow_drop_up_rounded
                              : Icons.arrow_drop_down_rounded,
                          size: 34,
                          color: Color.fromRGBO(38, 43, 106, 1),
                        ),
                        onPressed: () {
                          setState(() {
                            _isCategoryVisible = !_isCategoryVisible;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      // Define navigation logic based on the category
                    },
                    child: Visibility(
                      visible: _isCategoryVisible,
                      child: GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                        ),
                        children: _categories
                            .map((category) => GestureDetector(
                                  onTap: () {
                                    // Navigate to different screens based on the tapped category
                                    switch (category) {
                                      case 'General':
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    General()));
                                        break;
                                      case 'Dentist':
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dentist()));
                                        break;
                                      case 'Psychiatrist':
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Psychiatrist()));
                                        break;
                                      case 'Covid-19':
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Covid19()));
                                        break;
                                      case 'Surgeon':
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Surgeon()));
                                        break;
                                      case 'Cardiologist':
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Cardiologist()));
                                        break;
                                      default:
                                        break;
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 40,
                                        color:
                                            Color.fromRGBO(38, 43, 106, 0.85),
                                      ),
                                      Text(
                                        category,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ...dentists.map((doctor) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
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
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color:
                                      const Color.fromARGB(255, 176, 176, 176),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          SizedBox(height: 14),
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
                                                  color: Color.fromRGBO(
                                                      38, 43, 106, 1),
                                                  size: 16,
                                                ),
                                                SizedBox(width: 4),
                                                Text(doctor['rating']!),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 7),
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
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
