import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Fitness extends StatefulWidget {
  const Fitness({super.key});

  @override
  State<Fitness> createState() => _FitnessState();
}

class _FitnessState extends State<Fitness> with SingleTickerProviderStateMixin {
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
final List<Map<String, String>> fitnessArticles = [
  {
    "id": "1",
    "title": "The Ultimate Guide to Strength Training",
    "date": "Jan 15, 2024",
    "readTime": "8min read",
    "image":
        "https://tse4.mm.bing.net/th?id=OIP.2KLaQxdpPGME-rp0odF9VAHaEK&pid=Api&P=0&h=220",
    "description":
        "Strength training is essential for building muscle, improving bone density, and boosting metabolism. This guide covers key exercises, techniques, and tips to help you create an effective strength training program.",
    "category": "fitness",
  },
  {
    "id": "2",
    "title": "10 Best Yoga Poses for Beginners",
    "date": "Feb 25, 2024",
    "readTime": "7min read",
    "image":
        "https://tse3.mm.bing.net/th?id=OIP.wgRZ_nSHwD6qU-i3gd5teAHaE8&pid=Api&P=0&h=220",
    "description":
        "Yoga is a great way to improve flexibility, balance, and overall wellness. This article highlights ten beginner-friendly yoga poses that can help you get started on your yoga journey.",
    "category": "fitness",
  },
  {
    "id": "3",
    "title": "How to Build an Effective Cardio Workout Routine",
    "date": "Mar 10, 2024",
    "readTime": "12min read",
    "image":
        "https://tse1.mm.bing.net/th?id=OIP.5t_5qVBHy_MKNc5KGo_EowHaEK&pid=Api&P=0&h=220",
    "description":
        "Cardio workouts are crucial for improving heart health and endurance. This article provides tips on designing an effective cardio routine, including various types of cardio exercises and how to incorporate them into your weekly plan.",
    "category": "fitness",
  },
  {
    "id": "4",
    "title": "The Benefits of High-Intensity Interval Training (HIIT)",
    "date": "Apr 5, 2024",
    "readTime": "9min read",
    "image":
        "https://tse1.mm.bing.net/th?id=OIP.OmTrVu2iR7BwmlKgUCwM0wAAAA&pid=Api&P=0&h=220",
    "description":
        "High-Intensity Interval Training (HIIT) is a popular workout method that alternates between intense bursts of exercise and short recovery periods. Learn about the benefits of HIIT and how to incorporate it into your fitness routine.",
    "category": "fitness",
  },
  {
    "id": "5",
    "title": "Essential Tips for Running Your First 5K",
    "date": "May 20, 2024",
    "readTime": "10min read",
    "image":
        "https://tse3.mm.bing.net/th?id=OIP.aAdbD6E7jMJxMbGwyw1PNQHaE8&pid=Api&P=0&h=220",
    "description":
        "Running a 5K can be a rewarding fitness goal. This article provides essential tips and training advice for beginners preparing for their first 5K race, including how to build endurance and stay motivated.",
    "category": "fitness",
  },
];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Article',
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
              Routes().article,
              (route) => false,
            );
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fitness Articles',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Seeing ALL');
                    },
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 17, color: Color.fromRGBO(38, 43, 106, 1)),
                    ),
                  ),
                ],
              ),
            ),

            // _buildArticleListItem()
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: fitnessArticles.length,
              itemBuilder: (context, index) {
                final article = fitnessArticles[index];
                return _buildArticleListItem(article);
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildArticleListItem(Map<String, String> article) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 8),
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
}
