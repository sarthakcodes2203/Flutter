import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/views/homeScreen/mainScreen.dart';

class Allitemscart extends StatefulWidget {
  const Allitemscart({super.key});

  @override
  State<Allitemscart> createState() => _AllitemscartState();
}

class _AllitemscartState extends State<Allitemscart>
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

  int _counter = 1;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Medics Cart',
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
          backgroundColor: Color.fromRGBO(38, 43, 106, 1),
        ),
        // body: Center(child: Text('Cart items will appear here.')),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            int counter = 1; // Counter specific to each item

            return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['name']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.shopping_bag,
                                  color: Color.fromRGBO(38, 43, 106, 1),
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
                                          size: 18,
                                          color:
                                              Color.fromRGBO(38, 43, 106, 1)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13.0),
                                  child: Text(
                                    '$counter',
                                    style: TextStyle(
                                      fontSize: 24,
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
                                          size: 18,
                                          color:
                                              Color.fromRGBO(38, 43, 106, 1)),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  item['price']!,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(38, 43, 106, 1),
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
            );
          },
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
              onPressed: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Checked Out!"),
                    action: SnackBarAction(
                      label: 'Go to home', // Text for the action button
                      onPressed: () {
                        // Navigate to the cart page when clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Mainscreen()), // Replace CartPage() with your actual cart page
                        );
                      },
                    ),
                  ),
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
