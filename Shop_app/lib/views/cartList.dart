import 'package:flutter/material.dart';
import 'package:my_shop/routes/routes.dart';
import 'package:my_shop/views/orderDetails.dart';

class Cartlist extends StatefulWidget {
      String routeName = "/cartList";
 Cartlist({super.key});

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist>
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

  // Sample list of cart items
  final List<Map<String, String>> cartItems = [
    {
      'name': 'Product 1',
      'price': '\$25.00',
      'image': 'assets/product_cart.jpeg',
    },
    {
      'name': 'Product 2',
      'price': '\$35.00',
      'image': 'assets/product_cart.jpeg',
    },
    {
      'name': 'Product 3',
      'price': '\$45.00',
      'image': 'assets/product_cart.jpeg',
    },
  ];
  final total = '\$150.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              letterSpacing: 1.02,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().ciHome,
              Routes().homeWithBottombar,
              (route) => false,
            );
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
  itemCount: cartItems.length,
  itemBuilder: (context, index) {
    final item = cartItems[index];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        leading: Image.asset(
          item['image']!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          item['name']!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          item['price']!,
          style: TextStyle(fontSize: 14, color: Colors.blue),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              cartItems.removeAt(index);
            });
          },
        ),
      ),
    );
  },
),
      // body: ListView.builder(
      //   itemCount: cartItems.length,
      //   itemBuilder: (context, index) {
      //     final item = cartItems[index];
      //     return Card(
      //       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      //       child: ListTile(
      //         leading: Image.asset(
      //           item['image']!,
      //           width: 50,
      //           height: 50,
      //           fit: BoxFit.cover,
      //         ),
      //         title: Text(
      //           item['name']!,
      //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      //         ),
      //         subtitle: Text(
      //           item['price']!,
      //           style: TextStyle(fontSize: 14, color: Colors.blue),
      //         ),
      //         trailing: IconButton(
      //           icon: Icon(Icons.delete, color: Colors.red),
      //           onPressed: () {
      //             // Handle remove item from cart
      //           },
      //         ),
      //       ),
      //     );
      //   },
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ' + total,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle checkout process
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Cart(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 23),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
