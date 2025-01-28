import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet>
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

final List<Map<String, String>> dietArticles = [
  {
    "id": "1",
    "title": "The Ultimate Guide to Balanced Diets",
    "date": "Jan 10, 2024",
    "readTime": "9min read",
    "image":
        "https://tse4.mm.bing.net/th?id=OIP.c2J3br48qEhPj4Jmw6f52QHaFj&pid=Api&P=0&h=220",
    "description":
        "A balanced diet is crucial for maintaining overall health and well-being. This guide explores the components of a balanced diet, including essential nutrients and how to create meal plans that support a healthy lifestyle.",
    "category": "diet",
  },
  {
    "id": "2",
    "title": "Top 10 Foods for Weight Loss",
    "date": "Feb 15, 2024",
    "readTime": "7min read",
    "image":
        "https://tse4.mm.bing.net/th?id=OIP.qxS6YCQm72yJwuIS1NcVMQHaHX&pid=Api&P=0&h=220",
    "description":
        "Discover the top 10 foods that can aid in weight loss. This article highlights nutrient-dense foods that can help boost metabolism, reduce cravings, and support a healthy weight loss journey.",
    "category": "diet",
  },
  {
    "id": "3",
    "title": "Understanding Macronutrients: What You Need to Know",
    "date": "Mar 5, 2024",
    "readTime": "8min read",
    "image":
        "https://tse4.mm.bing.net/th?id=OIP.KpECSjJhmOAkO03uvbtAcgHaEK&pid=Api&P=0&h=220",
    "description":
        "Macronutrients—proteins, fats, and carbohydrates—are essential for energy and bodily functions. Learn about the role of each macronutrient, how to balance them in your diet, and their impact on overall health.",
    "category": "diet",
  },
  {
    "id": "4",
    "title": "The Benefits of a Plant-Based Diet",
    "date": "Apr 10, 2024",
    "readTime": "10min read",
    "image":
        "https://tse1.mm.bing.net/th?id=OIP.sieDEa01edGy0U9X2lc2LwHaGc&pid=Api&P=0&h=220",
    "description":
        "A plant-based diet can offer numerous health benefits, including reduced risk of chronic diseases. This article explores the advantages of adopting a plant-based diet, including tips for making the transition and ensuring nutritional adequacy.",
    "category": "diet",
  },
  {
    "id": "5",
    "title": "How to Maintain a Healthy Hydration Level",
    "date": "May 25, 2024",
    "readTime": "6min read",
    "image":
        "https://tse2.mm.bing.net/th?id=OIP.P3IH6JThQoKGI1yWaYlLxwHaE8&pid=Api&P=0&h=220",
    "description":
        "Staying hydrated is vital for overall health and wellness. This article provides insights into how much water you should drink, the signs of dehydration, and tips for maintaining optimal hydration throughout the day.",
    "category": "diet",
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
                    'Diet Articles',
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
              itemCount: dietArticles.length,
              itemBuilder: (context, index) {
                final article = dietArticles[index];
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
