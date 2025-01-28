import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/views/cartScreen/allItemsCart.dart';
import 'package:my_app/views/pharmacy/drugDetail.dart';

class Pharmacy extends StatefulWidget {
  String routeName = "/pharmacy";

  Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy>
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

  final List<Map<String, String>> recentProducts = [
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
  ];

  final List<Map<String, String>> popularProducts = [
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
    // Add more products as needed
  ];
  final List<Map<String, String>> saleProducts = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pharmacy',
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
          // actions: [
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     // Handle search button press
          //   },
          // ),
          // ],
        ),
        body: PopScope(
          canPop: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search drugs, categories...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Color.fromRGBO(38, 43, 106, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Allitemscart(),
                          ),
                        );

                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   // Routes().ciHome,
                        //   Routes().drugDetail,
                        //   (route) => false,
                        // );
                      },
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 2),
                  child: Card(
                    color: Color.fromRGBO(132, 137, 231, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order quickly with \nPrescription",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () {
                                    print("learn more");
                                  },
                                  child: Text(
                                    "Upload Prescription",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(38, 43, 106, 1),
                                      // minimumSize: Size(double.infinity, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(22))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/drugs/tabletStrip.jpeg',
                              width: 120,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 2, right: 16, left: 16, bottom: 2),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Popular Products',
                //         style: TextStyle(
                //             fontSize: 20, fontWeight: FontWeight.bold),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           print('Seeing ALL');
                //         },
                //         child: Text(
                //           'See all',
                //           style: TextStyle(
                //               fontSize: 17,
                //               color: Color.fromRGBO(38, 43, 106, 1)),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacyPopular.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacyPopular.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacyPopular.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacyPopular.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 8, right: 16, left: 16, bottom: 2),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Product on Sale',
                //         style: TextStyle(
                //             fontSize: 20, fontWeight: FontWeight.bold),
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           print('Seeing ALL');
                //         },
                //         child: Text(
                //           'See all',
                //           style: TextStyle(
                //               fontSize: 17,
                //               color: Color.fromRGBO(38, 43, 106, 1)),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacySale.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacySale.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacySale.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.pushNamedAndRemoveUntil(
                //             context,
                //             // Routes().ciHome,
                //             Routes().drugDetail,
                //             (route) => false,
                //           );
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       'assets/drugs/pharmacySale.jpeg',
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Panadol',
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           '20pcs',
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               '\$15.99',
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                         // Align(
                //                         //   alignment: Alignment.centerRight,
                //                         //   child:
                //                         //    IconButton(
                //                         //     icon: Icon(Icons.add_circle, color: Color.fromRGBO(38, 43, 106, 1)),
                //                         //     onPressed: () {
                //                         //       // Handle add button press
                //                         //     },
                //                         //   ),
                //                         // ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 2, right: 16, left: 16, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Products',
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
                                builder: (context) => Drugdetail(
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
                                    child: Image.network(
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
                                                  color: Color.fromRGBO(
                                                      38, 43, 106, 1)),
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
                                builder: (context) => Drugdetail(
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
                                    child: Image.network(
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
                                                  color: Color.fromRGBO(
                                                      38, 43, 106, 1)),
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
                                builder: (context) => Drugdetail(
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
                                    child: Image.network(
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
                                                  color: Color.fromRGBO(
                                                      38, 43, 106, 1)),
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

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: popularProducts.map((product) {
                //       return Padding(
                //         padding: const EdgeInsets.all(4.0),
                //         child: GestureDetector(
                //           onTap: () {
                //             // Navigator.push(
                //             //   context,
                //             //   MaterialPageRoute(
                //             //     builder: (context) => ProductDetails(
                //             //       image: product['image']!,
                //             //       name: product['name']!,
                //             //       quantity: product['quantity']!,
                //             //       price: product['price']!,
                //             //       rating:
                //             //           (double.tryParse(product['rating'] ?? '')
                //             //                   ?.toInt()) ??
                //             //               1,
                //             //     ),
                //             //   ),
                //             // );
                //           },
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       product['image']!,
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           product['name']!,
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           product['quantity']!,
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               product['price']!,
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: saleProducts.map((product) {
                //       return Padding(
                //         padding: const EdgeInsets.all(4.0),
                //         child: GestureDetector(
                //           onTap: () {
                //             // Navigator.push(
                //             //   context,
                //             //   MaterialPageRoute(
                //             //     builder: (context) => ProductDetails(
                //             //       image: product['image']!,
                //             //       name: product['name']!,
                //             //       quantity: product['quantity']!,
                //             //       price: product['price']!,
                //             //       rating:
                //             //           (double.tryParse(product['rating'] ?? '')
                //             //                   ?.toInt()) ??
                //             //               1,
                //             //     ),
                //             //   ),
                //             // );
                //           },
                //           child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //               side: BorderSide(color: Colors.grey.shade300),
                //             ),
                //             child: Container(
                //               width: 124,
                //               margin: EdgeInsets.all(4),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   ClipRRect(
                //                     borderRadius: BorderRadius.vertical(
                //                         top: Radius.circular(8.0)),
                //                     child: Image.asset(
                //                       product['image']!,
                //                       height: 104,
                //                       width: 124,
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 2, left: 4, right: 4),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           product['name']!,
                //                           style: TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.bold),
                //                         ),
                //                         Text(
                //                           product['quantity']!,
                //                           style: TextStyle(
                //                               fontSize: 12, color: Colors.grey),
                //                         ),
                //                         SizedBox(height: 2),
                //                         Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.spaceBetween,
                //                           children: [
                //                             Text(
                //                               product['price']!,
                //                               style: TextStyle(
                //                                   fontSize: 16,
                //                                   fontWeight: FontWeight.bold),
                //                             ),
                //                             IconButton(
                //                               icon: Icon(Icons.add_circle,
                //                                   color: Color.fromRGBO(
                //                                       38, 43, 106, 1)),
                //                               onPressed: () {
                //                                 // Handle add button press
                //                               },
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
