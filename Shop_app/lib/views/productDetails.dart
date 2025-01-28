import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shop/views/orderDetails.dart';
import 'package:my_shop/views/cartList.dart';

class ProductDetails extends StatefulWidget {
  // const ProductDetails({super.key});

  final String image;
  final String name;
  final String quantity;
  final String price;
  final int rating; // Optionally, include rating if needed
  // final int counter;

  ProductDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.rating,
    // this.rating = 3,
  }) : super(key: key);

  String routeName = "/productDetails";

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
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

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          // Product Image
          Container(
            height: 200,
            child: Image.asset(widget.image),
          ),
          // Product Details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.quantity,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          widget.rating > index
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow,
                        );
                      }),
                    ),
                    SizedBox(width: 3),
                    Text(
                      '${widget.rating.toString()}.0',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (counter > 1) {
                                  counter--;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(FontAwesomeIcons.minus,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Text(
                            '$counter',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                counter++;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Icon(FontAwesomeIcons.plus,
                                  color: Colors.blue),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    text: '',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                    children: [
                      TextSpan(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 90, 90),
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Read more',
                        style: TextStyle(
                          color: Color.fromARGB(255, 20, 97, 159),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Add to Cart logic
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartlist(),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart_rounded,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Orderdetails(
                        image: widget.image,
                        name: widget.name,
                        quantity: widget.quantity,
                        price: widget.price,
                        // counter: widget.counter,
                      ),
                    ),
                  );
                },
                child: Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
