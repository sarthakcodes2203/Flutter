import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shop/views/cartList.dart';

class Orderdetails extends StatefulWidget {
  // final String image;
  // final String name;
  // final String quantity;
  // final String price;
  // final int rating; // Add rating if needed

  // Orderdetails({
  //   Key? key,
  //   required this.image,
  //   required this.name,
  //   required this.quantity,
  //   required this.price,
  //   this.rating = 5, // Default rating if not provided
  // }) : super(key: key);
  final String image;
  final String name;
  final String quantity;
  final String price;
  // final int counter;

  Orderdetails(
      {required this.image,
      required this.name,
      required this.quantity,
      required this.price
      // required this.counter,
      });

  String routeName = "/orderDetails";

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int counter = 5;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 231, 229, 229),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Image.asset(
                              widget.image,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      // Icon(
                                      //   Icons.shopping_bag,
                                      //   color: Color.fromRGBO(38, 43, 106, 1),
                                      // ),
                                      SizedBox(width: 11),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    widget.quantity,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  counter--;
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Icon(
                                                  FontAwesomeIcons.minus,
                                                  size: 18,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0),
                                            child: Text(
                                              '$counter',
                                              style: TextStyle(
                                                fontSize: 21,
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
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Icon(
                                                  FontAwesomeIcons.plus,
                                                  size: 18,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(),
                                      // Text(
                                      //   widget.price,
                                      //   style: TextStyle(
                                      //     fontSize: 19,
                                      //     fontWeight: FontWeight.bold,
                                      //     color: Colors.blue,
                                      //   ),
                                      // ),
                                      // SizedBox(width: 16),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Payment Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxes',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '\$01.00',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                  SizedBox(height: 17),
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'VISA',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(227, 33, 149, 243),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Change',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 36),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'Total ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                  ),
                )
              ],
            ),
            SizedBox(width: 29),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   Routes().paymentDone,
                  //   (route) => false,
                  // );
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  // padding: EdgeInsets.symmetric(vertical: 15), // specify height
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
                  // Padding(
                  //   padding: const EdgeInsets.all(4.0),
                  //   child: Row(
                  //     children: [
                  //       Column(
                  //         children: [
                  //           Text(
                  //             'Total ',
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               color: Colors.grey,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           Text(
                  //             widget.price,
                  //             style: TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 21,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //       SizedBox(width: 28),
                  //       Expanded(
                  //         child: ElevatedButton(
                  //           onPressed: () {
                  //             // Navigator.pushNamedAndRemoveUntil(
                  //             //   context,
                  //             //   Routes().paymentDone,
                  //             //   (route) => false,
                  //             // );
                  //           },
                  //           child: Text(
                  //             'Checkout',
                  //             style:
                  //                 TextStyle(fontSize: 19, color: Colors.white),
                  //           ),
                  //           style: ElevatedButton.styleFrom(
                  //             backgroundColor: Colors.blue,
                  //             padding: EdgeInsets.symmetric(
                  //                 vertical: 15), // specify height
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
