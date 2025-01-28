import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/doctor/doctorDetails.dart';

class Homescreen extends StatefulWidget {
  String routeName = "/homeScreen";
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
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

  final List<Map<String, String>> healthArticles = [
    {
      "id": "1",
      "title": "The Ikigai",
      "date": "Jun 10, 2021",
      "readTime": "5min read",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.qOEWQ7OAFKfBQNe6_u2s1wHaFj&pid=Api&P=0&h=220",
      "description":
          "Discover the concept of Ikigai, a Japanese term meaning 'a reason for being.' This article explores how finding your Ikigai can lead to a more fulfilling and meaningful life.",
      "category": "health",
    },
    {
      "id": "2",
      "title":
          "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
      "date": "Mar 10, 2023",
      "readTime": "10min read",
      "image":
          "https://tse1.mm.bing.net/th?id=OIP.Gp0GOk0OHZ6TEncJE8insgHaEo&pid=Api&P=0&h=220",
      "description":
          "Explore the top 25 healthiest fruits recommended by nutritionists to boost your diet with essential vitamins, minerals, and antioxidants. These fruits are not only delicious but also packed with health benefits.",
      "category": "health",
    },
    {
      "id": "3",
      "title": "The 5 best exercise according to experts",
      "date": "Oct 20, 2021",
      "readTime": "15min read",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.f7yTiSIDC0UwTnOACa27WwHaHa&pid=Api&P=0&h=220",
      "description":
          "Discover the top five exercises recommended by fitness experts to enhance your strength, endurance, and overall health. These exercises are suitable for all fitness levels and can be easily incorporated into your routine.",
      "category": "health",
    }
  ];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Find your desire \nhealth solution',
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1.08,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30.0,
                      color: Color.fromRGBO(38, 43, 106, 1),
                      // Adjust the size as needed
                    ),
                  ],
                ),
                SizedBox(height: 26),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search doctor, drugs, articles...',
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().findDoctorsScreen,
                          (route) => false,
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_2_outlined,
                            size: 40,
                            color: Color.fromRGBO(38, 43, 106, 0.85),
                          ),
                          Text('Doctor', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().pharmacy,
                          (route) => false,
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.medical_services_outlined,
                            size: 40,
                            color: Color.fromRGBO(38, 43, 106, 0.85),
                          ),
                          Text('Pharmacy', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("tapped");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_hospital_outlined,
                            size: 40,
                            color: Color.fromRGBO(38, 43, 106, 0.85),
                          ),
                          Text('Hospital', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("tapped");
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 40,
                            color: Color.fromRGBO(38, 43, 106, 0.85),
                          ),
                          Text('Ambulance', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Card(
                  color: Color.fromRGBO(132, 137, 231, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Early protection for your \nfamily health",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    // Routes().ciHome,
                                    Routes().findDoctorsScreen,
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "Learn more",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(38, 43, 106, 1),
                                    // minimumSize: Size(double.infinity, 60),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(22))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/doctors/card.jpeg',
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Doctor",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().topDoctorsScreen,
                          (route) => false,
                        );
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(38, 43, 106, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                Container(
                  height: 200, // Adjust height as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = topDoctors[index];
                      return _buildTopDoctorListItem(context, doctor);
                    },
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Health article",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          // Routes().ciHome,
                          Routes().article,
                          (route) => false,
                        );
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(38, 43, 106, 1)),
                      ),
                    ),
                  ],
                ),

                // _buildArticleListItem()
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: healthArticles.length,
                  itemBuilder: (context, index) {
                    final article = healthArticles[index];
                    return _buildArticleListItem(article);
                  },
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(
                //       color: Colors.grey,
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         'assets/articles/article.jpeg',
                //         height: 90,
                //         width: 90,
                //       ),
                //       SizedBox(
                //         width: 12,
                //       ),
                //       Expanded(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
                //               style: TextStyle(
                //                 fontSize: 18,
                //                 fontWeight: FontWeight.w500,
                //                 color: Colors.black,
                //               ),
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 RichText(
                //                   text: const TextSpan(
                //                     text: '',
                //                     style: TextStyle(
                //                       color: Color(0xFF666666),
                //                       fontSize: 16,
                //                     ),
                //                     children: [
                //                       TextSpan(
                //                         text: 'Jun 10, 2021  ',
                //                         style: TextStyle(
                //                           color: Colors.grey,
                //                           fontSize: 17,
                //                           fontWeight: FontWeight.w400,
                //                         ),
                //                       ),
                //                       TextSpan(
                //                         text: '5min read',
                //                         style: TextStyle(
                //                           color: Color.fromRGBO(38, 43, 106, 1),
                //                           fontSize: 18,
                //                           fontWeight: FontWeight.w500,
                //                           decoration: TextDecoration.underline,
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Icon(
                //                   Icons.save_rounded,
                //                   color: Color.fromRGBO(38, 43, 106, 1),
                //                   size: 30.0,
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //       // Icon(
                //       //   Icons.save_rounded,
                //       //   color: Color.fromRGBO(38, 43, 106, 1),
                //       //   size: 30.0,
                //       // ),
                //     ],
                //   ),
                // ),

                SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArticleListItem(Map<String, String> article) {
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            article["image"]!,
            height: 90,
            width: 99,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  article["title"]!,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      article["date"]!,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _showDescriptionBottomSheet(article["description"]!);
                      },
                      child: Text(
                        article["readTime"]!,
                        style: TextStyle(
                          color: Color.fromRGBO(38, 43, 106, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.save_rounded,
                        color: Color.fromRGBO(38, 43, 106, 1),
                        size: 30.0,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Article saved!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDescriptionBottomSheet(String description) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopDoctorListItem(
      BuildContext context, Map<String, String> doctor) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes().doctorDetails,
          (route) => false,
          arguments: doctor, // Pass the doctor's data as an argument
        );
      },
      child: Container(
        width: 140,
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(doctor["image"]!),
            ),
            SizedBox(height: 6),
            Text(
              doctor["name"]!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 3),
            Text(doctor["speciality"]!),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star,
                    color: Color.fromRGBO(38, 43, 106, 1), size: 16),
                SizedBox(width: 4),
                Text(doctor["rating"]!),
                SizedBox(width: 4),
                Text("• ${doctor["distance"]!}"),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:my_app/routing/routes.dart';

// class Homescreen extends StatefulWidget {
//   String routeName = "/homeScreen";
//   Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

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

//   final List<Map<String, String>> healthArticles = [
//     {
//       "id": "1",
//       "title": "The Ikigai",
//       "date": "Jun 10, 2021",
//       "readTime": "5min read",
//       "image":
//           "https://tse4.mm.bing.net/th?id=OIP.qOEWQ7OAFKfBQNe6_u2s1wHaFj&pid=Api&P=0&h=220",
//       "description":
//           "Discover the concept of Ikigai, a Japanese term meaning 'a reason for being.' This article explores how finding your Ikigai can lead to a more fulfilling and meaningful life.",
//       "category": "health",
//     },
//     {
//       "id": "2",
//       "title":
//           "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
//       "date": "Mar 10, 2023",
//       "readTime": "10 read",
//       "image":
//           "https://tse1.mm.bing.net/th?id=OIP.Gp0GOk0OHZ6TEncJE8insgHaEo&pid=Api&P=0&h=220",
//       "description":
//           "Explore the top 25 healthiest fruits recommended by nutritionists to boost your diet with essential vitamins, minerals, and antioxidants. These fruits are not only delicious but also packed with health benefits.",
//       "category": "health",
//     },
//     {
//       "id": "3",
//       "title": "The 5 best exercise according to experts",
//       "date": "Oct 20, 2021",
//       "readTime": "15 read",
//       "image":
//           "https://tse2.mm.bing.net/th?id=OIP.f7yTiSIDC0UwTnOACa27WwHaHa&pid=Api&P=0&h=220",
//       "description":
//           "Discover the top five exercises recommended by fitness experts to enhance your strength, endurance, and overall health. These exercises are suitable for all fitness levels and can be easily incorporated into your routine.",
//       "category": "health",
//     }
//   ];

//   final List<Map<String, String>> topDoctors = [
//     {
//       "id": "1",
//       "image":
//           "https://tse4.mm.bing.net/th?id=OIP.5E3k8BOOi0Ux4PfseLWSfAHaE8&pid=Api&P=0&h=220",
//       "name": "Dr. Sarthak",
//       "speciality": "Cardiologist",
//       "rating": "4.7",
//       "distance": "800m away",
//       "about":
//           "Dr. Sarthak is a highly experienced cardiologist with over 15 years of experience in treating heart conditions. He is known for his compassionate care and cutting-edge treatment methods.",
//       "availability": "Sep 5, 2024 - 10:00 AM to 2:00 PM",
//       "avdate": "Sep 5 \n 2024",
//       "avdtime": "10:00 AM to 2:00 PM"
//     },
//     {
//       "id": "2",
//       "image":
//           "https://tse4.mm.bing.net/th?id=OIP.0fRsq6rCLtI974jJ3lEe2QHaG9&pid=Api&P=0&h=220",
//       "name": "Dr. Priya Sharma",
//       "speciality": "Dermatologist",
//       "rating": "4.8",
//       "distance": "1.2km away",
//       "about":
//           "Dr. Priya Sharma is a renowned dermatologist specializing in skin care and cosmetic treatments. With over 10 years of experience, she provides personalized care for all skin types.",
//       "availability": "Sep 5, 2024 - 11:00 AM to 3:00 PM",
//       "avdate": "Sep 5 \n 2024",
//       "avtime": "10:00 AM to 2:00 PM"
//     },
//     {
//       "id": "3",
//       "image":
//           "https://tse3.mm.bing.net/th?id=OIP.0Ttue7YQAsl2DKGwh4POzgHaHa&pid=Api&P=0&h=220",
//       "name": "Dr. Anil Mehta",
//       "speciality": "Pediatrician",
//       "rating": "4.6",
//       "distance": "600m away",
//       "about":
//           "Dr. Anil Mehta is a trusted pediatrician who has been caring for children for over 20 years. He is dedicated to ensuring the health and well-being of his young patients.",
//       "availability": "Sep 5, 2024 - 9:00 AM to 1:00 PM",
//       "avdate": "Sep 5 \n 2024",
//       "avdtime": "10:00 AM to 2:00 PM"
//     },
//     {
//       "id": "4",
//       "image":
//           "https://tse2.mm.bing.net/th?id=OIP._3v_3-C1nlzO0GHLUGQQ1gHaHa&pid=Api&P=0&h=220",
//       "name": "Dr. Kavita Rao",
//       "speciality": "Gynecologist",
//       "rating": "4.9",
//       "distance": "950m away",
//       "about":
//           "Dr. Kavita Rao is an expert gynecologist with extensive experience in women's health. She offers comprehensive care for a wide range of gynecological conditions.",
//       "availability": "Sep 5, 2024 - 1:00 PM to 5:00 PM",
//       "avdate": "Sep 5 \n 2024",
//       "avdtime": "10:00 AM to 2:00 PM"
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: EdgeInsets.zero,
//         // physics: NeverScrollableScrollPhysics(),
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding:
//                 const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Find your desire \nhealth solution',
//                       style: TextStyle(
//                           fontSize: 30,
//                           letterSpacing: 1.08,
//                           fontWeight: FontWeight.w600),
//                     ),
//                     Icon(
//                       Icons.notifications,
//                       size: 30.0,
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                       // Adjust the size as needed
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 26),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search doctor, drugs, articles...',
//                     hintStyle: TextStyle(
//                       color: Colors.grey,
//                     ),

//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.grey), // Set border color to grey

//                       borderRadius: BorderRadius.circular(
//                           30.0), // Adjust the radius as needed
//                     ),
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: Color.fromRGBO(38, 43, 106, 1),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(
//                         vertical: 10.0), // Adjust the vertical padding
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           // Routes().ciHome,
//                           Routes().findDoctorsScreen,
//                           (route) => false,
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.person_2_outlined,
//                             size: 40,
//                             color: Color.fromRGBO(38, 43, 106, 0.85),
//                           ),
//                           Text('Doctor', style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           // Routes().ciHome,
//                           Routes().pharmacy,
//                           (route) => false,
//                         );
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.medical_services_outlined,
//                             size: 40,
//                             color: Color.fromRGBO(38, 43, 106, 0.85),
//                           ),
//                           Text('Pharmacy', style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         print("tapped");
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.local_hospital_outlined,
//                             size: 40,
//                             color: Color.fromRGBO(38, 43, 106, 0.85),
//                           ),
//                           Text('Hospital', style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         print("tapped");
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.local_shipping_outlined,
//                             size: 40,
//                             color: Color.fromRGBO(38, 43, 106, 0.85),
//                           ),
//                           Text('Ambulance', style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Card(
//                   color: Color.fromRGBO(132, 137, 231, 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   elevation: 4,
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Early protection for your \nfamily health",
//                                 style: TextStyle(
//                                   fontSize: 21,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(height: 12),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pushNamedAndRemoveUntil(
//                                     context,
//                                     // Routes().ciHome,
//                                     Routes().findDoctorsScreen,
//                                     (route) => false,
//                                   );
//                                 },
//                                 child: Text(
//                                   "Learn more",
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor:
//                                         Color.fromRGBO(38, 43, 106, 1),
//                                     // minimumSize: Size(double.infinity, 60),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(22))),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 16),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: Image.asset(
//                             'assets/doctors/card.jpeg',
//                             width: 120,
//                             height: 180,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Top Doctor",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           // Routes().ciHome,
//                           Routes().topDoctorsScreen,
//                           (route) => false,
//                         );
//                       },
//                       child: Text(
//                         'See all',
//                         style: TextStyle(
//                           fontSize: 17,
//                           color: Color.fromRGBO(38, 43, 106, 1),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),

//                 Container(
//                   height: 200, // Adjust height as needed
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: topDoctors.length,
//                     itemBuilder: (context, index) {
//                       final doctor = topDoctors[index];
//                       return _buildTopDoctorListItem(context, doctor);
//                     },
//                   ),
//                 ),

//                 SizedBox(height: 20),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Health article",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           // Routes().ciHome,
//                           Routes().article,
//                           (route) => false,
//                         );
//                       },
//                       child: Text(
//                         'See all',
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Color.fromRGBO(38, 43, 106, 1)),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // _buildArticleListItem()
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: healthArticles.length,
//                   itemBuilder: (context, index) {
//                     final article = healthArticles[index];
//                     return _buildArticleListItem(article);
//                   },
//                 ),

//                 // Container(
//                 //   decoration: BoxDecoration(
//                 //     border: Border.all(
//                 //       color: Colors.grey,
//                 //       width: 1,
//                 //     ),
//                 //     borderRadius: BorderRadius.circular(10),
//                 //   ),
//                 //   child: Row(
//                 //     children: [
//                 //       Image.asset(
//                 //         'assets/articles/article.jpeg',
//                 //         height: 90,
//                 //         width: 90,
//                 //       ),
//                 //       SizedBox(
//                 //         width: 12,
//                 //       ),
//                 //       Expanded(
//                 //         child: Column(
//                 //           mainAxisAlignment: MainAxisAlignment.center,
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Text(
//                 //               "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
//                 //               style: TextStyle(
//                 //                 fontSize: 18,
//                 //                 fontWeight: FontWeight.w500,
//                 //                 color: Colors.black,
//                 //               ),
//                 //             ),
//                 //             SizedBox(
//                 //               height: 5,
//                 //             ),
//                 //             Row(
//                 //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //               children: [
//                 //                 RichText(
//                 //                   text: const TextSpan(
//                 //                     text: '',
//                 //                     style: TextStyle(
//                 //                       color: Color(0xFF666666),
//                 //                       fontSize: 16,
//                 //                     ),
//                 //                     children: [
//                 //                       TextSpan(
//                 //                         text: 'Jun 10, 2021  ',
//                 //                         style: TextStyle(
//                 //                           color: Colors.grey,
//                 //                           fontSize: 17,
//                 //                           fontWeight: FontWeight.w400,
//                 //                         ),
//                 //                       ),
//                 //                       TextSpan(
//                 //                         text: '5min read',
//                 //                         style: TextStyle(
//                 //                           color: Color.fromRGBO(38, 43, 106, 1),
//                 //                           fontSize: 18,
//                 //                           fontWeight: FontWeight.w500,
//                 //                           decoration: TextDecoration.underline,
//                 //                         ),
//                 //                       ),
//                 //                     ],
//                 //                   ),
//                 //                 ),
//                 //                 Icon(
//                 //                   Icons.save_rounded,
//                 //                   color: Color.fromRGBO(38, 43, 106, 1),
//                 //                   size: 30.0,
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //       // Icon(
//                 //       //   Icons.save_rounded,
//                 //       //   color: Color.fromRGBO(38, 43, 106, 1),
//                 //       //   size: 30.0,
//                 //       // ),
//                 //     ],
//                 //   ),
//                 // ),

//                 SizedBox(height: 4),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildArticleListItem(Map<String, String> article) {
//     return Container(
//       margin: const EdgeInsets.only(top: 2, bottom: 8),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           Image.network(
//             article["image"]!,
//             height: 90,
//             width: 99,
//           ),
//           SizedBox(
//             width: 12,
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   article["title"]!,
//                   style: TextStyle(
//                     fontSize: 19,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       article["date"]!,
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Text(
//                       article["readTime"]!,
//                       style: TextStyle(
//                         color: Color.fromRGBO(38, 43, 106, 1),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.save_rounded,
//                         color: Color.fromRGBO(38, 43, 106, 1),
//                         size: 30.0,
//                       ),
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Article saved!'),
//                             duration: Duration(seconds: 2),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTopDoctorListItem(
//       BuildContext context, Map<String, String> doctor) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamedAndRemoveUntil(
//           context,
//           Routes().doctorDetails,
//           (route) => false,
//           arguments: doctor, // Pass the doctor's data as an argument
//         );
//       },
//       child: Container(
//         width: 140,
//         margin: EdgeInsets.only(right: 8),
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//           border: Border.all(color: Colors.grey),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: NetworkImage(doctor["image"]!),
//             ),
//             SizedBox(height: 6),
//             Text(
//               doctor["name"]!,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             SizedBox(height: 3),
//             Text(doctor["speciality"]!),
//             Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.star,
//                     color: Color.fromRGBO(38, 43, 106, 1), size: 16),
//                 SizedBox(width: 4),
//                 Text(doctor["rating"]!),
//                 SizedBox(width: 4),
//                 Text("• ${doctor["distance"]!}"),
//               ],
//             ),
//             SizedBox(
//               height: 8,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
