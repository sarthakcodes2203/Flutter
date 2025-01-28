import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Managemedicines extends StatefulWidget {
  const Managemedicines({super.key});

  @override
  State<Managemedicines> createState() => _ManagemedicinesState();
}

class _ManagemedicinesState extends State<Managemedicines>
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

  List<Map<String, String>> medicines = [
    {
      'name': 'Paracetamol',
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.FUAuKqRMVW7BC5M4wN69zgHaFj&pid=Api&P=0&h=220',
      'quantity': '25pcs',
      'price': '\$8.99',
      'rating': '2.0',
      'composition': 'Paracetamol 500mg',
      'about': 'Used to reduce fever and relieve pain.',
      'expiryDate': '12/2024',
      'manufacturer': 'Pfizer Inc.',
      'storage': 'Store in a cool, dry place below 30°C.',
      'usageInstructions':
          'Take one tablet every 6 hours as needed for pain or fever.',
      'stockLeft': '550'
    },
    {
      'name': 'Antibiotic Cream',
      'imageUrl':
          'https://tse3.mm.bing.net/th?id=OIP.oFWwqaNFHs4jncHHUkj79wHaHa&pid=Api&P=0&h=220',
      'quantity': '1 tube',
      'price': '\$7.49',
      'rating': '4.0',
      'composition': 'Neomycin and Polymyxin B',
      'about': 'Used to prevent infections in minor cuts, scrapes, or burns.',
      'expiryDate': '10/2025',
      'manufacturer': 'Johnson & Johnson',
      'storage': 'Store below 25°C. Avoid direct sunlight.',
      'usageInstructions':
          'Apply a thin layer to the affected area twice daily.',
      'stockLeft': '990'
    },
    {
      'name': 'Band-Aid',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.cinqjclpvOhxusENsa-I4QHaHa&pid=Api&P=0&h=220',
      'quantity': '40pcs',
      'price': '\$2.0',
      'rating': '3.5',
      'composition': 'Adhesive bandages',
      'about': 'Protects minor wounds and keeps them clean.',
      'expiryDate': '05/2026',
      'manufacturer': '3M Healthcare',
      'storage': 'Keep in a dry place. Avoid moisture.',
      'usageInstructions':
          'Clean the wound and apply a Band-Aid. Replace as needed.',
      'stockLeft': '110'
    },
    {
      'name': 'Panadol',
      'imageUrl':
          'https://sp.yimg.com/ib/th?id=OPHS.3RzY0TGZI2KI5w474C474&o=5&pid=21.1&w=160&h=105',
      'quantity': '20pcs',
      'price': '\$15.99',
      'rating': '5.0',
      'composition': 'Paracetamol 500mg',
      'about': 'Used for pain relief and fever reduction.',
      'expiryDate': '03/2025',
      'manufacturer': 'GlaxoSmithKline',
      'storage': 'Store below 25°C in a dry place.',
      'usageInstructions':
          'Take one tablet every 4-6 hours as needed. Do not exceed 4 tablets in 24 hours.',
      'stockLeft': '200'
    },
    {
      'name': 'Aspirin',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.NsiespZAeMItSp_itm2_oAHaHa&pid=Api&P=0&h=220',
      'quantity': '10pcs',
      'price': '\$10.49',
      'rating': '4.5',
      'composition': 'Aspirin 325mg',
      'about': 'Used for pain relief, fever reduction, and inflammation.',
      'expiryDate': '08/2025',
      'manufacturer': 'Bayer Pharmaceuticals',
      'storage': 'Keep at room temperature, away from heat and moisture.',
      'usageInstructions': 'Take one tablet with water after meals as needed.',
      'stockLeft': '1200'
    },
    {
      'name': 'Ibuprofen',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.HktCBpPfL6BOdsHlb0kVdgHaEi&pid=Api&P=0&h=220',
      'quantity': '30pcs',
      'price': '\$12.99',
      'rating': '3.8',
      'composition': 'Ibuprofen 200mg',
      'about': 'Used for pain relief, inflammation, and fever reduction.',
      'expiryDate': '01/2025',
      'manufacturer': 'Advil Pharmaceuticals',
      'storage': 'Store in a cool, dry place below 30°C.',
      'usageInstructions':
          'Take one tablet every 4-6 hours as needed. Do not exceed 6 tablets in 24 hours.',
      'stockLeft': '450'
    },
    {
      'name': 'Cough Syrup',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.6eEgax172fOQLEg73rlM0wHaIE&pid=Api&P=0&h=220',
      'quantity': '100ml',
      'price': '\$5.99',
      'rating': '4.2',
      'composition': 'Dextromethorphan and Guaifenesin',
      'about': 'Provides relief from cough and chest congestion.',
      'expiryDate': '06/2025',
      'manufacturer': 'Vicks Pharmaceuticals',
      'storage': 'Keep in a cool place, away from direct sunlight.',
      'usageInstructions':
          'Take 5ml every 6 hours as needed. Shake well before use.',
      'stockLeft': '2500'
    },
    {
      'name': 'Multivitamin',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.OrRmf5d9tYdgeeKusDtnJgHaHa&pid=Api&P=0&h=220',
      'quantity': '50pcs',
      'price': '\$14.99',
      'rating': '4.5',
      'composition': 'Vitamin A, B, C, D, E',
      'about': 'Boosts overall health and immunity.',
      'expiryDate': '11/2025',
      'manufacturer': 'Centrum',
      'storage': 'Store in a dry place at room temperature.',
      'usageInstructions': 'Take one tablet daily with meals.',
      'stockLeft': '670'
    },
    {
      'name': 'Hand Sanitizer',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.5Qivk0BLppg62-MC9rNBRwHaHa&pid=Api&P=0&h=220',
      'quantity': '200ml',
      'price': '\$3.99',
      'rating': '2.8',
      'composition': '70% Ethanol',
      'about': 'Kills 99.9% of germs on hands.',
      'expiryDate': '09/2024',
      'manufacturer': 'Purell',
      'storage': 'Keep in a cool, dry place. Avoid direct sunlight.',
      'usageInstructions': 'Apply a small amount to hands and rub until dry.',
      'stockLeft': '200'
    },
  ];

  void deleteUser(int index) {
    setState(() {
      medicines.removeAt(index);
    });
  }

  void editUser(int index, Map<String, String> updatedUser) {
    setState(() {
      medicines[index] = updatedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicines',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes().secondSplashScreen,
            //   (route) => false,
            // );
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final medicine = medicines[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailViewScreen(user: medicine),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(medicine['imageUrl']!),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                medicine['name']!,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Price: ${medicine['price']}'),
                              Text('Rating: ${medicine['rating']}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditUserScreen(
                                  user: medicine,
                                  onSave: (updatedUser) =>
                                      editUser(index, updatedUser),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Confirm Delete'),
                                content: Text(
                                    'Are you sure you want to delete ${medicine['name']}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      deleteUser(index);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newMedicine = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicineScreen(),
            ),
          );

          if (newMedicine != null) {
            setState(() {
              medicines.add(newMedicine);
            });
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              width: 42,
              height: 42,
            ),
            Icon(Icons.add, size: 32, color: Colors.white),
          ],
        ),
        tooltip: 'Add Medicine',
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
        shape: CircleBorder(), // Make the button round
      ),
    );
  }
}

class EditUserScreen extends StatefulWidget {
  final Map<String, String> user;
  final Function(Map<String, String>) onSave;

  EditUserScreen({required this.user, required this.onSave});

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController nameController;
  late TextEditingController quantityController;
  late TextEditingController priceController;
  late TextEditingController ratingController;
  late TextEditingController compositionController;
  late TextEditingController aboutController;
  late TextEditingController expiryDateController;
  late TextEditingController manufacturerController;
  late TextEditingController storageController;
  late TextEditingController usageInstructionsController;
  late TextEditingController stockLeftController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user['name']);
    quantityController = TextEditingController(text: widget.user['quantity']);
    priceController = TextEditingController(text: widget.user['price']);
    ratingController = TextEditingController(text: widget.user['rating']);
    compositionController =
        TextEditingController(text: widget.user['composition']);
    aboutController = TextEditingController(text: widget.user['about']);
    expiryDateController =
        TextEditingController(text: widget.user['expiryDate']);
    manufacturerController =
        TextEditingController(text: widget.user['manufacturer']);
    storageController = TextEditingController(text: widget.user['storage']);
    usageInstructionsController =
        TextEditingController(text: widget.user['usageInstructions']);
    stockLeftController = TextEditingController(text: widget.user['stockLeft']);
  }

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    priceController.dispose();
    ratingController.dispose();
    compositionController.dispose();
    aboutController.dispose();
    expiryDateController.dispose();
    manufacturerController.dispose();
    storageController.dispose();
    usageInstructionsController.dispose();
    stockLeftController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit User',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes().secondSplashScreen,
            //   (route) => false,
            // );
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(widget.user['imageUrl']!),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) {
                            return Wrap(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Choose from Gallery'),
                                  onTap: () {
                                    // Handle gallery selection logic here
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text('Take Picture'),
                                  onTap: () {
                                    // Handle camera selection logic here
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.edit, size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Other form fields go here...

              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
              ),
              TextField(
                controller: compositionController,
                decoration: InputDecoration(labelText: 'Composition'),
              ),
              TextField(
                controller: aboutController,
                decoration: InputDecoration(labelText: 'About'),
              ),
              TextField(
                controller: expiryDateController,
                decoration: InputDecoration(labelText: 'Best Before'),
              ),
              TextField(
                controller: storageController,
                decoration: InputDecoration(labelText: 'Storage Instruction'),
              ),
              TextField(
                controller: usageInstructionsController,
                decoration: InputDecoration(labelText: 'Usage Instruction'),
              ),
              TextField(
                controller: stockLeftController,
                decoration: InputDecoration(labelText: 'Stock Left'),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedUser = {
                    'name': nameController.text,
                    'quantity': quantityController.text,
                    'price': priceController.text,
                    'rating': ratingController.text,
                    'composition': compositionController.text,
                    'about': aboutController.text,
                    'expiryDate': expiryDateController.text,
                    'storage': storageController.text,
                    'usageInstructions': usageInstructionsController.text,

                    'imageUrl':
                        widget.user['imageUrl']!, // Retain the image URL
                  };
                  widget.onSave(updatedUser);
                  Navigator.pop(context);
                },
                child: Text('Save',
                    style: TextStyle(color: Color.fromRGBO(38, 43, 106, 1))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailViewScreen extends StatelessWidget {
  final Map<String, String> user;

  DetailViewScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medicine Details',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Profile Image with Styling
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user['imageUrl']!),
            ),
            SizedBox(height: 16),
            Text(
              user['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            SizedBox(height: 20),
            // User Information List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Quantity', user['quantity']!),
                  _buildInfoRow('Price', user['price']!),
                  _buildInfoRow('Rating', user['rating']!),
                  _buildInfoRow('About', user['about']!),
                  _buildInfoRow('Best before', user['expiryDate'] ?? 'N/A'),
                  _buildInfoRow(
                      'Storage Instruction', user['storage'] ?? 'N/A'),
                  _buildInfoRow(
                      'Usage Insrtuction', user['usageInstructions'] ?? 'N/A'),
                  _buildInfoRow('Composition', user['composition']!),
                  _buildInfoRow('Stock Left', user['stockLeft'] ?? 'N/A'),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget for building each row of information
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}

class AddMedicineScreen extends StatefulWidget {
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _ratingController = TextEditingController();
  final _compositionController = TextEditingController();
  final _aboutController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _storageController = TextEditingController();
  final _usageInstructionsController = TextEditingController();
  final _stockLeftController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Medicine',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes().secondSplashScreen,
            //   (route) => false,
            // );
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _compositionController,
                decoration: InputDecoration(labelText: 'Composition'),
              ),
              TextField(
                controller: _aboutController,
                decoration: InputDecoration(labelText: 'About'),
              ),
              TextField(
                controller: _expiryDateController,
                decoration: InputDecoration(labelText: 'Expiry Date'),
              ),
              // TextField(
              //   controller: _manufacturerController,
              //   decoration: InputDecoration(labelText: 'Manufacturer'),
              // ),
              TextField(
                controller: _storageController,
                decoration: InputDecoration(labelText: 'Storage Instructions'),
              ),
              TextField(
                controller: _usageInstructionsController,
                decoration: InputDecoration(labelText: 'Usage Instructions'),
              ),
              TextField(
                controller: _stockLeftController,
                decoration: InputDecoration(labelText: 'Stock Left'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final newMedicine = {
                    'name': _nameController.text,
                    'imageUrl': _imageUrlController.text,
                    'quantity': _quantityController.text,
                    'price': _priceController.text,
                    'rating': _ratingController.text,
                    'composition': _compositionController.text,
                    'about': _aboutController.text,
                    'expiryDate': _expiryDateController.text,
                    'manufacturer': _manufacturerController.text,
                    'storage': _storageController.text,
                    'usageInstructions': _usageInstructionsController.text,
                    'stockLeft': _stockLeftController.text,
                  };
                  Navigator.pop(context, newMedicine);
                },
                child: Text('Add Medicine'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
