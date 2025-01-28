import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/cartScreen/allItemsCart.dart';
import 'package:my_app/views/cartScreen/cart.dart';

class Drugdetail extends StatefulWidget {
  String routeName = "/drugDetail";
  // Drugdetail({super.key});
  final String image;
  final String name;
  final String quantity;
  final String price;
  final int rating; // Optionally, include rating if needed
  // final int counter;

  Drugdetail({
    Key? key,
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.rating,
    // this.rating = 3,
  }) : super(key: key);

  @override
  State<Drugdetail> createState() => _DrugdetailState();
}

class _DrugdetailState extends State<Drugdetail> {
  // int _currentIndex = 0;
  int _rating = 5;
  int counter = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Drug Details',
//             style: TextStyle(
//                 color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
//           ),
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 // Routes().ciHome,
//                 Routes().pharmacy,
//                 (route) => false,
//               );
//             },
//           ),
//           backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//           // actions: [
//           //   IconButton(
//           //     icon: Icon(
//           //       Icons.threesixty,
//           //       color: Colors.white,
//           //     ),
//           //     onPressed: () {},
//           //   ),
//           // ],
//         ),
//         body: PopScope(
//           canPop: false,
//           child: ListView(
//             children: [
//               // Product Image
//               Container(
//                 height: 300,
//                 child: Image.asset('assets/drugs/drug.jpeg'),
//               ),
//               // Product Details
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'OBH Combi',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '75ml',
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           _rating >= 1 ? Icons.star : Icons.star_border,
//                           color: Colors.yellow,
//                         ),
//                         Icon(
//                           _rating >= 2 ? Icons.star : Icons.star_border,
//                           color: Colors.yellow,
//                         ),
//                         Icon(
//                           _rating >= 3 ? Icons.star : Icons.star_border,
//                           color: Colors.yellow,
//                         ),
//                         Icon(
//                           _rating >= 4 ? Icons.star : Icons.star_border,
//                           color: Colors.yellow,
//                         ),
//                         Icon(
//                           _rating >= 5 ? Icons.star : Icons.star_border,
//                           color: Colors.yellow,
//                         ),
//                         SizedBox(
//                           width: 3,
//                         ),
//                         Text(
//                           '5.0',
//                           style: TextStyle(
//                               color: Color.fromRGBO(38, 43, 106, 1),
//                               fontSize: 17,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 // border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               child: InkWell(
//                                 onTap: () {
//                                   // decrement counter
//                                   setState(() {
//                                     counter--;
//                                   });
//                                 },
//                                 child: Padding(
//                                     padding: const EdgeInsets.all(1.0),
//                                     child: Icon(Icons.minimize)),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 13.0),
//                               child: Text(
//                                 '$counter',
//                                 style: TextStyle(
//                                     fontSize: 30, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 // border: Border.all(color: Colors.grey),
//                                 color: Colors.white, // background color
//                               ),
//                               child: InkWell(
//                                 onTap: () {
//                                   // increment counter
//                                   setState(() {
//                                     counter++;
//                                   });
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(1.0),
//                                   // child: Text(
//                                   //   '+',
//                                   //   style: TextStyle(
//                                   //     fontSize: 34,
//                                   //     fontWeight: FontWeight.bold,
//                                   //     color: Colors.grey, // text color
//                                   //   ),
//                                   // ),
//                                   child: Icon(Icons.add_circle,
//                                       color: Color.fromRGBO(38, 43, 106, 1)),
//                                   // onPressed: () {
//                                   // },
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Text(
//                           '\$12.99',
//                           style: TextStyle(
//                               fontSize: 26,
//                               color: Color.fromRGBO(38, 43, 106, 1),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 6,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Description',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 6,
//                     ),
//                     RichText(
//                       text: const TextSpan(
//                         text: '',
//                         style:
//                             TextStyle(color: Color(0xFF666666), fontSize: 16),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 92, 90, 90),
//                               fontSize: 14,
//                               // fontWeight: FontWeight.w500
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'Read more',
//                             style: TextStyle(
//                               color: Color.fromRGBO(38, 43, 106, 1),
//                               fontSize: 16,
//                               // fontWeight: FontWeight.w600,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Expanded(child: Container()), // Add this line
//               // Spacer(), // Add this line
//               SizedBox(
//                 height: 111,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {},
//                         // child: Text('Add to Cart'),
//                         child: Icon(Icons.shopping_cart_rounded)),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamedAndRemoveUntil(
//                             context,
//                             // Routes().ciHome,
//                             Routes().cart,
//                             (route) => false,
//                           );
//                         },
//                         child: Text(
//                           'Buy Now',
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

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
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: ListView(
        children: [
          // Product Image
          Container(
            height: 200,
            child: Image.network(widget.image),
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
                        color: Color.fromRGBO(38, 43, 106, 1),
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
                                  color: Color.fromRGBO(38, 43, 106, 1)),
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
                                  color: Color.fromRGBO(38, 43, 106, 1)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      // widget.price,
                      '\$${(double.tryParse(widget.price.replaceAll(RegExp(r'[\$,]'), '')) ?? 0.0) * counter}',

                      style: TextStyle(
                        fontSize: 26,
                        color: Color.fromRGBO(38, 43, 106, 1),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Cartlist(),
                //   ),
                // );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Item added to cart."),
                    action: SnackBarAction(
                      label: 'View Cart', // Text for the action button
                      onPressed: () {
                        // Navigate to the cart page when clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Allitemscart()), // Replace CartPage() with your actual cart page
                        );
                      },
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart_rounded,
                color: Color.fromRGBO(38, 43, 106, 1),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(
                          // image: widget.image,
                          // name: widget.name,
                          // quantity: widget.quantity,
                          // price: widget.price,
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
                  backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
