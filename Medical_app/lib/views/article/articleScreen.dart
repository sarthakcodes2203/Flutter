import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/article/categoryArticle/diet.dart';
import 'package:my_app/views/article/categoryArticle/fitness.dart';
import 'package:my_app/views/article/categoryArticle/covid19.dart';
// import 'package:flutter/widgets.dart';

class Article extends StatefulWidget {
  String routeName = "/article";

  Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> with SingleTickerProviderStateMixin {
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

  final List<Map<String, String>> relatedArticles = [
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

  final List<Map<String, String>> trendingArticles = [
    {
      "id": "1",
      "title": "Mindfulness Meditation for Beginners",
      "date": "Jan 15, 2023",
      "readTime": "8 min read",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.IEDP62IODsV9D5Yy_OftWgHaE6&pid=Api&P=0&h=220",
      "description":
          "Learn the basics of mindfulness meditation and how it can help reduce stress, improve focus, and enhance overall well-being.",
      "category": "mental health",
    },
    {
      "id": "2",
      "title": "The Importance of Hydration",
      "date": "Feb 20, 2023",
      "readTime": "6 min read",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.hmFcpcBs2TjhZNFUZOntLwHaE8&pid=Api&P=0&h=220",
      "description":
          "Explore the numerous benefits of staying hydrated and tips on how to increase your water intake throughout the day.",
      "category": "nutrition",
    },
    {
      "id": "3",
      "title": "Yoga for Stress Relief",
      "date": "Mar 5, 2023",
      "readTime": "12 min read",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.IzTY4JSNpnxVnDgiDB89GgHaEu&pid=Api&P=0&h=220",
      "description":
          "Discover how yoga can be a powerful tool for reducing stress and promoting relaxation in your daily life.",
      "category": "fitness",
    },
    {
      "id": "4",
      "title": "Benefits of a Plant-Based Diet",
      "date": "Apr 10, 2023",
      "readTime": "10 min read",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.l6ISDiyXcD9steKtoHS_kAHaGc&pid=Api&P=0&h=220",
      "description":
          "Learn about the health benefits of adopting a plant-based diet and how it can improve your overall well-being.",
      "category": "nutrition",
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
              Routes().mainScreen,
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
              padding: const EdgeInsets.only(
                  top: 22, left: 12, right: 12, bottom: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search articles, news...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(36.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryChip('Covid-19', 0),
                    _buildCategoryChip('Diet', 1),
                    _buildCategoryChip('Fitness', 2),
                  ],
                ),
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Articles',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Seeing ALL');
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontSize: 17, color: Color.fromRGBO(38, 43, 106, 1)),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendingArticles.length,
                itemBuilder: (context, index) {
                  final trarticle = trendingArticles[index];
                  return _buildArticleCard(trarticle);
                },
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Related Articles',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Seeing ALL');
                    },
                    child: Text(
                      'See all',
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
              itemCount: relatedArticles.length,
              itemBuilder: (context, index) {
                final article = relatedArticles[index];
                return _buildArticleListItem(article);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 2, right: 2, bottom: 22),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index; // Update selected index
          });
          _navigateToPage(index);
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: selectedIndex == index ? Colors.white : Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedIndex == index
              ? Color.fromRGBO(38, 43, 106, 1)
              : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Covid19()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Diet()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Fitness()),
        );
        break;
      default:
        break;
    }
  }

  Widget _buildArticleCard(Map<String, String> trarticle) {
    return Container(
      width: 183,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(trarticle["image"]!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                trarticle["title"]!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                children: [
                  Text(trarticle["date"]!,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  SizedBox(width: 5),
                  Text(
                    trarticle["readTime"]!,
                    style: TextStyle(
                      color: Color.fromRGBO(38, 43, 106, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
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
