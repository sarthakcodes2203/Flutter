import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shop/views/productDetails.dart';

class Home extends StatefulWidget {
      String routeName = "/home";
 Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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

  final List<Map<String, String>> popularProducts = [
    {
      'image': 'assets/product.jpeg',
      'name': 'Panadol',
      'quantity': '20pcs',
      'price': '\$15.99',
    },
    {
      'image': 'assets/product.jpeg',
      'name': 'Aspirin',
      'quantity': '10pcs',
      'price': '\$10.49',
    },
    {
      'image': 'assets/product.jpeg',
      'name': 'Ibuprofen',
      'quantity': '30pcs',
      'price': '\$12.99',
    },
    // Add more products as needed
  ];
  final List<Map<String, String>> saleProducts = [
    {
      'image': 'assets/product.jpeg',
      'name': 'Cough Syrup',
      'quantity': '100ml',
      'price': '\$5.99',
    },
    {
      'image': 'assets/product.jpeg',
      'name': 'Multivitamin',
      'quantity': '50pcs',
      'price': '\$14.99',
    },
    {
      'image': 'assets/product.jpeg',
      'name': 'Hand Sanitizer',
      'quantity': '200ml',
      'price': '\$3.99',
    },
    // Add more products as needed
  ];
  final List<Map<String, String>> recentProducts = [
    {
      'image': 'assets/product.jpeg',
      'name': 'Paracetamol',
      'quantity': '25pcs',
      'price': '\$8.99',
      'rating': '2.0',
    },
    {
      'image': 'assets/product.jpeg',
      'name': 'Antibiotic Cream',
      'quantity': '1 tube',
      'price': '\$7.49',
      'rating': '4.0',
    },
    {
      'image': 'assets/product.jpeg',
      'name': 'Band-Aid',
      'quantity': '40pcs',
      'price': '\$4.99',
    },
    // Add more products as needed
  ];

  // final int rating=5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Shop',
            style: TextStyle(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // Navigator.pushNamedAndRemoveUntil(
          //     //   context,
          //     //   // Routes().ciHome,
          //     //   Routes().mainScreen,
          //     //   (route) => false,
          //     // );
          //   },
          // ),
          backgroundColor: Colors.blue,
        ),
        body: PopScope(
          canPop: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search items, products...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    // FontAwesomeIcons.filter,color: Colors.blue,
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.filter,
                        color: Color.fromARGB(157, 18, 77, 126),
                      ),
                      onPressed: () {
                        _showCategoryOptions();
                      },
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, right: 16, left: 16, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently visited products',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Seeing ALL');
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
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: recentProducts.map((product) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  image: product['image']!,
                                  name: product['name']!,
                                  quantity: product['quantity']!,
                                  price: product['price']!,
                                  rating:
                                      (double.tryParse(product['rating'] ?? '')
                                              ?.toInt()) ??
                                          1,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                            child: Container(
                              width: 124,
                              margin: EdgeInsets.all(4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8.0)),
                                    child: Image.asset(
                                      product['image']!,
                                      height: 104,
                                      width: 124,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, left: 4, right: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['name']!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          product['quantity']!,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product['price']!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add_circle,
                                                  color: Colors.blue),
                                              onPressed: () {
                                                // Handle add button press
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, right: 16, left: 16, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Products',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Seeing ALL');
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
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: popularProducts.map((product) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  image: product['image']!,
                                  name: product['name']!,
                                  quantity: product['quantity']!,
                                  price: product['price']!,
                                  rating:
                                      (double.tryParse(product['rating'] ?? '')
                                              ?.toInt()) ??
                                          1,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                            child: Container(
                              width: 124,
                              margin: EdgeInsets.all(4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8.0)),
                                    child: Image.asset(
                                      product['image']!,
                                      height: 104,
                                      width: 124,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, left: 4, right: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['name']!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          product['quantity']!,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product['price']!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add_circle,
                                                  color: Colors.blue),
                                              onPressed: () {
                                                // Handle add button press
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, right: 16, left: 16, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Products on Sale',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          print('Seeing ALL');
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
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: saleProducts.map((product) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  image: product['image']!,
                                  name: product['name']!,
                                  quantity: product['quantity']!,
                                  price: product['price']!,
                                  rating:
                                      (double.tryParse(product['rating'] ?? '')
                                              ?.toInt()) ??
                                          1,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                            child: Container(
                              width: 124,
                              margin: EdgeInsets.all(4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8.0)),
                                    child: Image.asset(
                                      product['image']!,
                                      height: 104,
                                      width: 124,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, left: 4, right: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['name']!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          product['quantity']!,
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              product['price']!,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add_circle,
                                                  color: Colors.blue),
                                              onPressed: () {
                                                // Handle add button press
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _showCategoryOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Category 1'),
                onTap: () {
                  // handle category 1 selection
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Category 2'),
                onTap: () {
                  // handle category 2 selection
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Category 3'),
                onTap: () {
                  // handle category 3 selection
                  Navigator.of(context).pop();
                },
              ),
              // add more categories as needed
            ],
          ),
        );
      },
    );
  }
}
