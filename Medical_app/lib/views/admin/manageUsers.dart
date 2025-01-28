import 'package:flutter/material.dart';
import 'package:my_app/views/admin/adminPage.dart';

class Manageusers extends StatefulWidget {
  const Manageusers({super.key});

  @override
  State<Manageusers> createState() => _ManageusersState();
}

class _ManageusersState extends State<Manageusers>
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

  final counter = 1;
  
  List<Map<String, String>> users = [
    {
      'name': 'Sarthak Chakraborty',
      'age': '20',
      'gender': 'Male',
      'email': 'sarthak@gmail.com',
      'phone': '888-999-0000',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.9_MptOLxjJEGSGukPt9FWQHaHa&pid=Api&P=0&h=220', // Replace with real URLs if available
    },
    {
      'name': 'John Doe',
      'age': '32',
      'gender': 'Male',
      'email': 'john.doe@example.com',
      'phone': '777-666-555',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.srNFFzORAaERcWvhwgPzVAHaHa&pid=Api&P=0&h=220',
    },
    {
      'name': 'John pal',
      'age': '22',
      'gender': 'Male',
      'email': 'john.pal@example.com',
      'phone': '123-456-7890',
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP.e1KNYwnuhNwNj7_-98yTRwHaF7&pid=Api&P=0&h=220',
    },
    {
      'name': 'Jane Smith',
      'age': '28',
      'gender': 'Female',
      'email': 'jane.smith@example.com',
      'phone': '987-654-3210',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.PqBYGErQeWQWhbA_VeUBDQHaHa&pid=Api&P=0&h=220',
    },
    {
      'name': 'Emily Johnson',
      'age': '45',
      'gender': 'Female',
      'email': 'emily.johnson@example.com',
      'phone': '456-789-1234',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.WpnGIPj1DKAGo-CP64znTwHaHa&pid=Api&P=0&h=220',
    },
    {
      'name': 'Michael Brown',
      'age': '38',
      'gender': 'Male',
      'email': 'michael.brown@example.com',
      'phone': '321-654-9870',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.x5SkAlBbBVNCjri-g7CqBgHaHa&pid=Api&P=0&h=220',
    },
  ];

  void deleteUser(int index) {
    setState(() {
      users.removeAt(index);
    });
  }

  void editUser(int index, Map<String, String> updatedUser) {
    setState(() {
      users[index] = updatedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
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
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return
              //  Card(
              //   margin: EdgeInsets.all(8),
              //   child: Column(
              //     children: [
              //       ListTile(
              //         leading: CircleAvatar(
              //           backgroundImage: NetworkImage(user['imageUrl']!),
              //         ),
              //         title: Text(user['name']!),
              //         subtitle: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text('Age: ${user['age']}'),
              //             Text('Gender: ${user['gender']}'),
              //             // Text('Email: ${user['email']}'),
              //             // Text('Phone: ${user['phone']}'),
              //           ],
              //         ),
              //         isThreeLine: true,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           TextButton(
              //             onPressed: () {
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => EditUserScreen(
              //                     user: user,
              //                     onSave: (updatedUser) =>
              //                         editUser(index, updatedUser),
              //                   ),
              //                 ),
              //               );
              //             },
              //             child: Text(
              //               'Edit',
              //               style: TextStyle(color: Color.fromRGBO(38, 43, 106, 1)),
              //             ),
              //           ),
              //           TextButton(
              //             onPressed: () {
              //               showDialog(
              //                 context: context,
              //                 builder: (context) => AlertDialog(
              //                   title: Text('Confirm Delete'),
              //                   content: Text(
              //                       'Are you sure you want to remove ${user['name']}?'),
              //                   actions: [
              //                     TextButton(
              //                       onPressed: () => Navigator.pop(context),
              //                       child: Text('Cancel'),
              //                     ),
              //                     TextButton(
              //                       onPressed: () {
              //                         deleteUser(index);
              //                         Navigator.pop(context);
              //                       },
              //                       child: Text(
              //                         'Delete',
              //                         style: TextStyle(color: Colors.red),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               );
              //             },
              //             child: Text('Delete',
              //                 style:
              //                     TextStyle(color: Color.fromRGBO(38, 43, 106, 1))),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );

              GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailViewScreen(user: user),
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
                          backgroundImage: NetworkImage(user['imageUrl']!),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name']!,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Age: ${user['age']}'),
                              Text('Gender: ${user['gender']}'),
                              // Text('Email: ${user['email']}'),
                              // Text('Phone: ${user['phone']}'),
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
                                  user: user,
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
                                    'Are you sure you want to delete ${user['name']}?'),
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
  late TextEditingController ageController;
  late TextEditingController genderController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user['name']);
    ageController = TextEditingController(text: widget.user['age']);
    genderController = TextEditingController(text: widget.user['gender']);
    emailController = TextEditingController(text: widget.user['email']);
    phoneController = TextEditingController(text: widget.user['phone']);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    emailController.dispose();
    phoneController.dispose();
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
      body: Padding(
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
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedUser = {
                  'name': nameController.text,
                  'age': ageController.text,
                  'gender': genderController.text,
                  'email': emailController.text,
                  'phone': phoneController.text,
                  'imageUrl': widget.user['imageUrl']!, // Retain the image URL
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
    );
  }
}

class DetailViewScreen extends StatelessWidget {
  final Map<String, String> user;

  // Example data for purchased medicines and booked doctors
  final List<Map<String, String>> purchasedMedicines = [
    {
      'name': 'Paracetamol',
      'quantity': '10 tablets',
      'price': '\$5.99',
      'rating': '4.5',
      'date': '2024-10-01'
    },
    {
      'name': 'Ibuprofen',
      'quantity': '20 tablets',
      'price': '\$7.99',
      'rating': '4.3',
      'date': '2024-09-25'
    },
    {
      'name': 'Amoxicillin',
      'quantity': '30 capsules',
      'price': '\$12.49',
      'rating': '4.8',
      'date': '2024-09-18'
    },
  ];

  final List<Map<String, String>> bookedDoctors = [
    {
      'name': 'Dr. Priya Sharma',
      'specialty': 'Dermatologist',
      'date': '2024-10-05',
      'imageUrl': 'https://tse4.mm.bing.net/th?id=OIP.0fRsq6rCLtI974jJ3lEe2QHaG9&pid=Api&P=0&h=220'
    },
    {
      'name': 'Dr. Anil Mehta',
      'specialty': 'Pediatrician',
      'date': '2024-09-20',
      'imageUrl': 'https://tse3.mm.bing.net/th?id=OIP.0Ttue7YQAsl2DKGwh4POzgHaHa&pid=Api&P=0&h=220'
    },
    {
      'name': 'Dr. Kavita Rao',
      'specialty': 'Gynecologist',
      'date': '2024-09-15',
      'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP._3v_3-C1nlzO0GHLUGQQ1gHaHa&pid=Api&P=0&h=220'
    },
  ];

  DetailViewScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(
          'User Details',
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
                  _buildInfoRow('Age', user['age']!),
                  _buildInfoRow('Gender', user['gender']!),
                  _buildInfoRow('Email', user['email']!),
                  _buildInfoRow('Phone', user['phone']!),
                ],
              ),
            ),
            SizedBox(height: 20),
            // History of Purchased Medicines Section
            _buildSectionTitle('Purchased Medicines'),
            _buildMedicineHistory(),
            SizedBox(height: 20),
            // History of Booked Doctors Section
            _buildSectionTitle('Booked Doctors'),
            _buildBookedDoctors(),
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

  // Widget for section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  // Widget to display the list of purchased medicines
  Widget _buildMedicineHistory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: purchasedMedicines.map((medicine) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine['name']!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  _buildInfoRow('Quantity', medicine['quantity']!),
                  _buildInfoRow('Price', medicine['price']!),
                  _buildInfoRow('Rating', medicine['rating']!),
                  _buildInfoRow('Date', medicine['date']!),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Widget to display the list of booked doctors
  Widget _buildBookedDoctors() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: bookedDoctors.length,
      itemBuilder: (context, index) {
        final doctor = bookedDoctors[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(doctor['imageUrl']!),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor['name']!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        doctor['specialty']!,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text('Appointment Date: ${doctor['date']}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


