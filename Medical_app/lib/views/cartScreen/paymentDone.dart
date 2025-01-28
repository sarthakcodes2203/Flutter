import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Paymentdone extends StatefulWidget {
        String routeName="/paymentDone";

   Paymentdone({super.key});

  @override
  State<Paymentdone> createState() => _PaymentdoneState();
}

class _PaymentdoneState extends State<Paymentdone>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Cart",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: Stack(children: [
        Opacity(
          opacity: 0.1,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.all(4),
                          // padding: EdgeInsets.all(16),
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
                                    'assets/cart/cartImage.jpeg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 18),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'OBH Combi',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.shopping_bag,
                                              color: Color.fromRGBO(
                                                  38, 43, 106, 1),
                                            ),
                                            SizedBox(
                                              width: 11,
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          '75ml',
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
                                            Icon(Icons.countertops_outlined),
                                            Spacer(),
                                            Text(
                                              '\$19.99',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    38, 43, 106, 1),
                                              ),
                                            ),
                                            SizedBox(width: 16),
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
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text('Coupons',
                        //         style: TextStyle(
                        //             fontSize: 18, fontWeight: FontWeight.bold)),
                        //     SizedBox(height: 8),
                        //     Row(
                        //       children: [
                        //         Expanded(
                        //           child: TextField(
                        //             decoration: InputDecoration(
                        //               hintText: 'Apply Coupon',
                        //               border: OutlineInputBorder(),
                        //             ),
                        //           ),
                        //         ),
                        //         SizedBox(width: 8),
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             print("Coupon Applied");
                        //           },
                        //           child: Text(
                        //             "Apply",
                        //             style: TextStyle(
                        //               fontSize: 13,
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //           ),
                        //           style: ElevatedButton.styleFrom(
                        //               backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                        //               // minimumSize: Size(double.infinity, 60),
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius: BorderRadius.circular(18))),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // Divider(),

                        Text(
                          "Payment Details",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
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
                                  '\$25.98',
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
                                  '\$26.98',
                                  style: TextStyle(
                                    color: Color.fromRGBO(38, 43, 106, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 6),
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
                                      color: Color.fromRGBO(38, 43, 106, 1)),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Change',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                      // decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),

                        // SizedBox(height: 52),

                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Column(children: [
                                Text(
                                  'Total ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$26.98',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 21),
                                )
                              ]),
                              SizedBox(width: 28),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Checkout',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(38, 43, 106, 1),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15), // specify height
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            color: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Icon(
                    Icons.check_circle,
                    color: Color.fromRGBO(51, 56, 124, 0.949),
                    size: 50,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Payment Success",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Color.fromRGBO(38, 43, 106, 1),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Your payment has been successful,\n you can have a consultation session with your trusted doctor",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                                            Navigator.pushNamedAndRemoveUntil(
                        context,
                        // Routes().ciHome,
                        Routes().mainScreen,
                        (route) => false,
                      );


                      setState(() {
                        // _signedIn = false;
                      });
                    },
                    child: Text(
                      "Back to home",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                      minimumSize: Size(120, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}


