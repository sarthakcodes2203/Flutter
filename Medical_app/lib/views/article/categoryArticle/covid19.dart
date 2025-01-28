import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Covid19 extends StatefulWidget {
  const Covid19({super.key});

  @override
  State<Covid19> createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> with SingleTickerProviderStateMixin {
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

  final List<Map<String, String>> covidArticles = [
    {
      "id": "1",
      "title": "Understanding COVID-19: Symptoms and Prevention",
      "date": "Jan 20, 2024",
      "readTime": "8min read",
      "image":
          "https://tse1.mm.bing.net/th?id=OIP.74ZhsxKCOkrBLMzDEoX9VAHaEi&pid=Api&P=0&h=220",
      "description":
          "Learn about the symptoms of COVID-19 and the essential measures you can take to prevent the spread of the virus. This article covers preventive practices, hygiene tips, and the importance of vaccination.",
      "category": "covid",
    },
    {
      "id": "2",
      "title": "The Impact of COVID-19 on Mental Health",
      "date": "Feb 18, 2024",
      "readTime": "10min read",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.COB8cTqI5bImJ6DWjHvxVgHaEK&pid=Api&P=0&h=220",
      "description":
          "The COVID-19 pandemic has significantly affected mental health worldwide. This article explores the psychological impact of the pandemic, including stress, anxiety, and coping strategies to support mental well-being.",
      "category": "covid",
    },
    {
      "id": "3",
      "title": "How COVID-19 Vaccines Work and Their Benefits",
      "date": "Mar 12, 2024",
      "readTime": "9min read",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.QtBtreLYEbV6R_hb_Oe46AHaE8&pid=Api&P=0&h=220",
      "description":
          "This article provides an overview of how COVID-19 vaccines work, their benefits in preventing severe illness, and the science behind vaccine development. Learn about different types of vaccines and their effectiveness.",
      "category": "covid",
    },
    {
      "id": "4",
      "title": "COVID-19 Variants: What You Need to Know",
      "date": "Apr 8, 2024",
      "readTime": "11min read",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.29QGU_nqi8vapncMNH1dbgHaEK&pid=Api&P=0&h=220",
      "description":
          "This article provides information about different COVID-19 variants, their characteristics, and how they impact public health. Understand the importance of monitoring variants and their role in vaccine effectiveness.",
      "category": "covid",
    },
    {
      "id": "5",
      "title": "Post-COVID-19 Recovery: Navigating the Path Forward",
      "date": "May 15, 2024",
      "readTime": "8min read",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.MDUHYugGtDC7K03XJZvcwQHaE8&pid=Api&P=0&h=220",
      "description":
          "Navigating recovery from COVID-19 involves understanding common long-term symptoms and adopting effective management strategies. This article explores post-recovery challenges, provides insights on dealing with lingering effects, and offers practical tips for improving health and well-being after the virus.",
      "category": "covid"
    }
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
                    'Covid-19 Articles',
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
              itemCount: covidArticles.length,
              itemBuilder: (context, index) {
                final article = covidArticles[index];
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
