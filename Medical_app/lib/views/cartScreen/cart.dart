import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/pharmacy/drugDetail.dart';
import 'package:dio/dio.dart'; // Add this import for Dio package
import 'package:path_provider/path_provider.dart'; // For getting system directory
import 'dart:io'; // For File operations
import 'package:flutter/services.dart'; // For loading assets

class Cart extends StatefulWidget {
  String routeName = "/cart";

  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
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
  String _image = '';
  String _name = '';
  String _quantity = '';
  String _price = '';
  int _rating = 0;
  int _counter = 0;

  String _selectedPaymentMethod = 'VISA';
  void _showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'VISA',
            'MasterCard',
            'American Express',
            'PayPal',
            'Google Pay'
          ].map((method) {
            return ListTile(
              title: Text(method),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = method;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  List<Map<String, String>> items = [
    {
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.FUAuKqRMVW7BC5M4wN69zgHaFj&pid=Api&P=0&h=220',
      'name': 'Paracetamol',
      'quantity': '25pcs',
      'price': '\$8.99',
      'rating': '2.0',
    },
    {
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.oFWwqaNFHs4jncHHUkj79wHaHa&pid=Api&P=0&h=220',
      'name': 'Antibiotic Cream',
      'quantity': '1 tube',
      'price': '\$7.49',
      'rating': '4.0',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.cinqjclpvOhxusENsa-I4QHaHa&pid=Api&P=0&h=220',
      'name': 'Band-Aid',
      'quantity': '40pcs',
      'price': '\$2.0',
    },
    // Add more products as needed
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.6eEgax172fOQLEg73rlM0wHaIE&pid=Api&P=0&h=220',
      'name': 'Cough Syrup',
      'quantity': '100ml',
      'price': '\$5.99',
      'rating': '4.2',
    },
    {
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.OrRmf5d9tYdgeeKusDtnJgHaHa&pid=Api&P=0&h=220',
      'name': 'Multivitamin',
      'quantity': '50pcs',
      'price': '\$14.99',
      'rating': '4.5',
    },
    {
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.5Qivk0BLppg62-MC9rNBRwHaHa&pid=Api&P=0&h=220',
      'name': 'Hand Sanitizer',
      'quantity': '200ml',
      'price': '\$3.99',
      'rating': '2.8',
    },
    // Add more products as needed
    {
      'image':
          'https://sp.yimg.com/ib/th?id=OPHS.3RzY0TGZI2KI5w474C474&o=5&pid=21.1&w=160&h=105',
      'name': 'Panadol',
      'quantity': '20pcs',
      'price': '\$15.99',
      'rating': '5.0',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.NsiespZAeMItSp_itm2_oAHaHa&pid=Api&P=0&h=220',
      'name': 'Aspirin',
      'quantity': '10pcs',
      'price': '\$10.49',
      'rating': '4.5',
    },
    {
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.HktCBpPfL6BOdsHlb0kVdgHaEi&pid=Api&P=0&h=220',
      'name': 'Ibuprofen',
      'quantity': '30pcs',
      'price': '\$12.99',
      'rating': '3.8',
    },
  ];

// // Function to download PDF
//   Future<void> downloadPDF() async {
//     Dio dio = Dio();
//     try {
//       // Getting the system's temp directory
//       var dir = await getApplicationDocumentsDirectory();
//       // Replace 'your_pdf_url' with the actual URL
//       String url = 'assets/demoMoneyReceipt_Digvijayam.pdf.pdf';
//       String savePath = "${dir.path}/PurchaseReciept_demo.pdf";
//       // Download the file
//       await dio.download(url, savePath);
//       print("PDF downloaded and saved to $savePath");
//     } catch (e) {
//       print("Error downloading file: $e");
//     }
//   }

  Future<void> downloadPDF(BuildContext context) async {
    try {
      // Load the file from assets
      ByteData data =
          await rootBundle.load('assets/cart/demoMoneyReceipt_Digvijayam.pdf');
      List<int> bytes = data.buffer.asUint8List();

      // Get the system's directory for saving files
      var dir = await getApplicationDocumentsDirectory();
      String savePath = "${dir.path}/PurchaseReceipt_demo.pdf";

      // Save the file locally
      File file = File(savePath);
      await file.writeAsBytes(bytes);

      // Show success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar(content: Text("Receipt saved to $savePath")),
        SnackBar(content: Text("Receipt saved to Downloads")),
      );

      print("PDF downloaded and saved to $savePath");
    } catch (e) {
      print("Error downloading file: $e");

      // Show error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error downloading Receipt")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = items[0]; // First element of the list
    final itemPrice =
        double.parse(item['price']!.replaceAll(RegExp(r'[\$,]'), ''));
    final tax = 01.00;
    final totalPrice = itemPrice + tax;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Order Summary',
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
              // Navigator.pushNamedAndRemoveUntil(
              //   context,
              //   // Routes().ciHome,
              //   Routes().drugDetail,
              //   (route) => false,
              // );
            },
          ),
          backgroundColor: Color.fromRGBO(38, 43, 106, 1),
        ),
        body: PopScope(
          canPop: false,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        // Container(
                        //   margin: EdgeInsets.all(4),
                        //   // padding: EdgeInsets.all(16),
                        //   decoration: BoxDecoration(
                        //     color: Color.fromARGB(255, 231, 229, 229),
                        //     borderRadius: BorderRadius.circular(10),
                        //     boxShadow: [
                        //       BoxShadow(
                        //         color: Colors.grey.withOpacity(0.1),
                        //         spreadRadius: 1,
                        //         blurRadius: 5,
                        //         offset: Offset(0, 2),
                        //       ),
                        //     ],
                        //   ),
                        //   child: Card(
                        //     color: Colors.white,
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(4.0),
                        //       child: Row(
                        //         children: [
                        //           Image.asset(
                        //             'assets/cart/cartImage.jpeg',
                        //             height: 100,
                        //             width: 100,
                        //             fit: BoxFit.cover,
                        //           ),
                        //           SizedBox(width: 18),
                        //           Expanded(
                        //             child: Column(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 SizedBox(
                        //                   height: 3,
                        //                 ),
                        //                 Row(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Text(
                        //                       'OBH Combi',
                        //                       style: TextStyle(
                        //                         fontSize: 20,
                        //                         fontWeight: FontWeight.bold,
                        //                       ),
                        //                     ),
                        //                     Spacer(),
                        //                     Icon(
                        //                       Icons.shopping_bag,
                        //                       color: Color.fromRGBO(
                        //                           38, 43, 106, 1),
                        //                     ),
                        //                     SizedBox(
                        //                       width: 11,
                        //                     )
                        //                   ],
                        //                 ),
                        //                 SizedBox(height: 3),
                        //                 Text(
                        //                   '75ml',
                        //                   style: TextStyle(
                        //                     fontSize: 16,
                        //                     color: Colors.grey,
                        //                   ),
                        //                   maxLines: 2,
                        //                   overflow: TextOverflow.ellipsis,
                        //                 ),
                        //                 SizedBox(height: 16),
                        //                 Row(
                        //                   children: [
                        //                     Row(
                        //                       children: [
                        //                         Container(
                        //                           decoration: BoxDecoration(
                        //                             // border: Border.all(color: Colors.grey),
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     5),
                        //                           ),
                        //                           child: InkWell(
                        //                             onTap: () {
                        //                               // decrement counter
                        //                               setState(() {
                        //                                 counter--;
                        //                               });
                        //                             },
                        //                             child: Padding(
                        //                               padding:
                        //                                   const EdgeInsets.all(
                        //                                       1.0),
                        //                               child: Icon(
                        //                                   FontAwesomeIcons
                        //                                       .minus,
                        //                                   size: 16,
                        //                                   color: Color.fromRGBO(
                        //                                       38, 43, 106, 1)),
                        //                             ),
                        //                           ),
                        //                         ),
                        //                         Padding(
                        //                           padding: const EdgeInsets
                        //                               .symmetric(
                        //                               horizontal: 6.0),
                        //                           child: Text(
                        //                             '$counter',
                        //                             style: TextStyle(
                        //                                 fontSize: 22,
                        //                                 fontWeight:
                        //                                     FontWeight.bold),
                        //                           ),
                        //                         ),
                        //                         Container(
                        //                           decoration: BoxDecoration(
                        //                             // border: Border.all(color: Colors.grey),
                        //                             color: Colors
                        //                                 .white, // background color
                        //                           ),
                        //                           child: InkWell(
                        //                             onTap: () {
                        //                               // increment counter
                        //                               setState(() {
                        //                                 counter++;
                        //                               });
                        //                             },
                        //                             child: Padding(
                        //                               padding:
                        //                                   const EdgeInsets.all(
                        //                                       1.0),
                        //                               child: Icon(Icons.add,
                        //                                   size: 18,
                        //                                   color: Color.fromRGBO(
                        //                                       38, 43, 106, 1)),
                        //                               // onPressed: () {
                        //                               // },
                        //                             ),
                        //                           ),
                        //                         )
                        //                       ],
                        //                     ),
                        //                     Spacer(),
                        //                     Text(
                        //                       '\$19.99',
                        //                       style: TextStyle(
                        //                         fontSize: 16,
                        //                         fontWeight: FontWeight.bold,
                        //                         color: Color.fromRGBO(
                        //                             38, 43, 106, 1),
                        //                       ),
                        //                     ),
                        //                     SizedBox(width: 16),
                        //                   ],
                        //                 ),
                        //                 SizedBox(height: 16),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        Container(
                          margin: EdgeInsets.all(8),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    item['image']!,
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
                                        SizedBox(height: 3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item['name']!,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.delete,
                                              color: Color.fromRGBO(
                                                  38, 43, 106, 1),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          item['quantity']!,
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
                                            Text(
                                              item['price']!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    38, 43, 106, 1),
                                              ),
                                            ),
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
                                  item['price']!,
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
                                  '\$${totalPrice.toStringAsFixed(2)}',
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
                                  _selectedPaymentMethod,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(38, 43, 106, 1)),
                                ),
                                GestureDetector(
                                  onTap: _showOptions,
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
                        SizedBox(
                          height: 36,
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.all(4.0),
                        //   child: Row(
                        //     children: [
                        //       Column(children: [
                        //         Text(
                        //           'Total ',
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               color: Colors.grey,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //         Text(
                        //           '\$26.98',
                        //           style: TextStyle(
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 21),
                        //         )
                        //       ]),
                        //       SizedBox(width: 28),
                        //       Expanded(
                        //         child: ElevatedButton(
                        //           onPressed: () {
                        //             Navigator.pushNamedAndRemoveUntil(
                        //               context,
                        //               // Routes().ciHome,
                        //               Routes().paymentDone,
                        //               (route) => false,
                        //             );
                        //           },
                        //           child: Text(
                        //             'Checkout',
                        //             style: TextStyle(
                        //                 fontSize: 16, color: Colors.white),
                        //           ),
                        //           style: ElevatedButton.styleFrom(
                        //             backgroundColor:
                        //                 Color.fromRGBO(38, 43, 106, 1),
                        //             padding: EdgeInsets.symmetric(
                        //                 vertical: 15), // specify height
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(children: [
          Column(children: [
            Text(
              'Total ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '\$99.99',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 21),
            )
          ]),
          SizedBox(width: 28),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                await downloadPDF(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes().paymentDone,
                  (route) => false,
                );
              },
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(38, 43, 106, 1),
                padding: EdgeInsets.symmetric(vertical: 15), // specify height
              ),
            ),
          ),
        ])));
  }
}
