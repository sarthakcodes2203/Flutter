import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/cardiologist.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/covid19.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/dentist.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/general.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/psychiatrist.dart';
import 'package:my_app/views/doctor/categoryFindDoctors/surgeon.dart';

class Finddoctorsscreen extends StatefulWidget {
  String routeName = "/findDoctorsScreen";

  Finddoctorsscreen({super.key});

  @override
  State<Finddoctorsscreen> createState() => _FinddoctorsscreenState();
}

class _FinddoctorsscreenState extends State<Finddoctorsscreen>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Doctors',
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
              Routes().mainScreen,
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
              Text('Recommended Doctors',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // _recommendedDoctorCard(),

              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes().doctorDetails,
                    arguments: {
                      "image":
                          "https://tse4.mm.bing.net/th?id=OIP.5E3k8BOOi0Ux4PfseLWSfAHaE8&pid=Api&P=0&h=220", // Replace with dynamic image URL
                      "name": "Dr. Sarthak", // Replace with dynamic name
                      "speciality":
                          "Cardiologist", // Replace with dynamic speciality
                      "rating": "4.7", // Replace with dynamic rating
                      "distance": "800m away", // Replace with dynamic distance
                    },
                  );
                },
                // onTap: () {
                //   Navigator.pushNamedAndRemoveUntil(
                //     context,
                //     // Routes().ciHome,
                //     Routes().doctorDetails,
                //     (route) => false,
                //   );
                // },
                child: Container(
                  color: Colors.white,
                  height: 170,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 176, 176, 176),
                            width: 1), // Add this line
                      ),
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  'https://tse4.mm.bing.net/th?id=OIP.5E3k8BOOi0Ux4PfseLWSfAHaE8&pid=Api&P=0&h=220'),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 15, right: 16, top: 28),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Sarthak",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
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
                                  Row(
                                    children: [
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
                                      SizedBox(width: 11),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            "800m away",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Text('Your Recent Doctors',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/doctors/top.jpeg'),
                          radius: 50,
                        ),
                        SizedBox(height: 10),
                        Text('Dr. Sarthak', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    SizedBox(width: 20),
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
