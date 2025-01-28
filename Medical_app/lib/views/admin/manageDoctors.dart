import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';

class Managedoctors extends StatefulWidget {
  const Managedoctors({super.key});

  @override
  State<Managedoctors> createState() => _ManagedoctorsState();
}

class _ManagedoctorsState extends State<Managedoctors>
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

  List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Sarthak Chakraborty',
      'age': '20',
      'gender': 'Male',
      'email': 'sarthak@gmail.com',
      'phone': '888-999-0000',
      'speciality': 'Cardiologist',
      'rating': '4.7',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.5E3k8BOOi0Ux4PfseLWSfAHaE8&pid=Api&P=0&h=220', // Replace with real URLs if available
    },
    {
      'name': 'Dr. Priya Sharma',
      'age': '32',
      'gender': 'Female',
      'email': 'priya.sharma@example.com',
      'phone': '777-666-555',
      'speciality': 'Dermatologist',
      'rating': '4.8',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.0fRsq6rCLtI974jJ3lEe2QHaG9&pid=Api&P=0&h=220',
    },
    {
      'name': 'Dr. Anil Mehta',
      'age': '22',
      'gender': 'Male',
      'email': 'anil.mehta@example.com',
      'phone': '123-456-7890',
      'speciality': 'Pediatrician',
      'rating': '4.6',
      'imageUrl':
          'https://tse3.mm.bing.net/th?id=OIP.0Ttue7YQAsl2DKGwh4POzgHaHa&pid=Api&P=0&h=220',
    },
    {
      'name': 'Dr. Kavita Rao',
      'age': '28',
      'gender': 'Female',
      'email': 'kevita.rao@example.com',
      'phone': '987-654-3210',
      'speciality': 'Gynecologist',
      'rating': '4.9',
      'imageUrl':
          'https://tse2.mm.bing.net/th?id=OIP._3v_3-C1nlzO0GHLUGQQ1gHaHa&pid=Api&P=0&h=220',
    },
    {
      'name': 'Dr. Emily Johnson',
      'age': '45',
      'gender': 'Female',
      'email': 'emily.johnson@example.com',
      'phone': '456-789-1234',
      'speciality': 'General Physician',
      'rating': '4.7',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.zk6ljBq0PJHHSl6kgbrKVAHaHa&pid=Api&P=0&h=220',
    },
    {
      'name': 'Dr. Michael Brown',
      'age': '38',
      'gender': 'Male',
      'email': 'michael.brown@example.com',
      'phone': '321-654-9870',
      'speciality': 'Orthopedic',
      'rating': '4.4',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.0pM9NKJ5NAbloXtvJkBRFAHaJ4&pid=Api&P=0&h=220',
    },
  ];

  void deleteUser(int index) {
    setState(() {
      doctors.removeAt(index);
    });
  }

  void editUser(int index, Map<String, String> updatedUser) {
    setState(() {
      doctors[index] = updatedUser;
    });
  }

  // final CollectionReference fetchData =
  //     FirebaseFirestore.instance.collection("data");

  // // Function to delete a doctor
  // void deleteUserdb(String docId) async {
  //   await fetchData.doc(docId).delete();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('Doctor deleted successfully')),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctors',
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
      body: Column(
        children: [
          // Add Expanded to constrain the ListView's height
          Expanded(
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailViewScreen(user: doctor),
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
                                backgroundImage:
                                    NetworkImage(doctor['imageUrl']!),
                              ),
                              SizedBox(width: 16),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctor['name']!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text('Speciality: ${doctor['speciality']}'),
                                    Text('Rating: ${doctor['rating']}'),
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
                                        user: doctor,
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
                                          'Are you sure you want to delete ${doctor['name']}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
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
          ),

          // db>>>>>>

          // StreamBuilder<QuerySnapshot>(
          //   stream: fetchData.snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //     if (snapshot.hasError) {
          //       return Center(child: Text('Error: ${snapshot.error}'));
          //     }
          //     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          //       return Center(child: Text('No doctors available'));
          //     }
          //     final doctors = snapshot.data!.docs;
          //     return ListView.builder(
          //       itemCount: doctors.length,
          //       itemBuilder: (context, index) {
          //         final doctor = doctors[index];
          //         final doctorData = doctor.data() as Map<String, dynamic>;
          //         return GestureDetector(
          //           onTap: () {
          //             // Navigator.push(
          //             //   context,
          //             //   MaterialPageRoute(
          //             //     builder: (context) => DetailViewScreen(user: doctorData),
          //             //   ),
          //             // );
          //           },
          //           child: Card(
          //             margin: EdgeInsets.all(8),
          //             child: Stack(
          //               children: [
          //                 Padding(
          //                   padding: EdgeInsets.all(16),
          //                   child: Row(
          //                     children: [
          //                       CircleAvatar(
          //                         radius: 40,
          //                         backgroundImage: NetworkImage(
          //                             doctorData['imageUrl'] ?? ''),
          //                       ),
          //                       SizedBox(width: 16),
          //                       Expanded(
          //                         child: Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Text(
          //                               doctorData['name'] ?? 'No Name',
          //                               style: TextStyle(
          //                                   fontSize: 18,
          //                                   fontWeight: FontWeight.bold),
          //                             ),
          //                             SizedBox(height: 4),
          //                             Text(
          //                                 'Speciality: ${doctorData['speciality'] ?? 'N/A'}'),
          //                             Text(
          //                                 'Rating: ${doctorData['rating'] ?? 'N/A'}'),
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //                 Positioned(
          //                   top: 8,
          //                   right: 8,
          //                   child: Row(
          //                     children: [
          //                       // IconButton(
          //                       //   icon: Icon(Icons.edit, color: Colors.blue),
          //                       //   onPressed: () {
          //                       //     // Navigator.push(
          //                       //     //   context,
          //                       //     //   MaterialPageRoute(
          //                       //     //     builder: (context) => EditUserScreen(
          //                       //     //       user: doctorData,
          //                       //     //       onSave: (updatedUser) async {
          //                       //     //         await fetchData
          //                       //     //             .doc(doctor.id)
          //                       //     //             .update(updatedUser);
          //                       //     //       },
          //                       //     //     ),
          //                       //     //   ),
          //                       //     // );
          //                       //   },
          //                       // ),
          //                       IconButton(
          //                         icon: Icon(Icons.edit, color: Colors.blue),
          //                         onPressed: () {
          //                           Navigator.push(
          //                             context,
          //                             MaterialPageRoute(
          //                               builder: (context) => EditUserScreen(
          //                                 user:
          //                                     doctorData, // Send the doctor data to the edit screen
          //                                 docId: doctor
          //                                     .id, // Pass the Firestore document ID
          //                                 onSave: (updatedUser) async {
          //                                   await fetchData
          //                                       .doc(doctor.id)
          //                                       .update(updatedUser);
          //                                   ScaffoldMessenger.of(context)
          //                                       .showSnackBar(
          //                                     SnackBar(
          //                                         content: Text(
          //                                             '${updatedUser['name']} updated successfully!')),
          //                                   );
          //                                 },
          //                               ),
          //                             ),
          //                           );
          //                         },
          //                       ),
          //                       IconButton(
          //                         icon: Icon(Icons.delete, color: Colors.red),
          //                         onPressed: () {
          //                           showDialog(
          //                             context: context,
          //                             builder: (context) => AlertDialog(
          //                               title: Text('Confirm Delete'),
          //                               content: Text(
          //                                   'Are you sure you want to delete ${doctorData['name']}?'),
          //                               actions: [
          //                                 TextButton(
          //                                   onPressed: () =>
          //                                       Navigator.pop(context),
          //                                   child: Text('Cancel'),
          //                                 ),
          //                                 TextButton(
          //                                   onPressed: () {
          //                                     deleteUserdb(doctor.id);
          //                                     Navigator.pop(context);
          //                                   },
          //                                   child: Text('Delete'),
          //                                 ),
          //                               ],
          //                             ),
          //                           );
          //                         },
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       },
          //     );
          //   },
          // ),
        
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newDoctor = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDoctorScreen(),
            ),
          );

          if (newDoctor != null) {
            setState(() {
              doctors.add(newDoctor);
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
        tooltip: 'Add Doctor',
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
        shape: CircleBorder(), // Make the button round
      ),
    );
  }
}

// class EditDbUserScreen extends StatefulWidget {
//   final Map<String, dynamic> user; // User data to edit
//   final String docId; // Firestore document ID
//   final Function(Map<String, dynamic>) onSave;
//   EditDbUserScreen({required this.user, required this.docId, required this.onSave});
//   @override
//   _EditDbUserScreenState createState() => _EditDbUserScreenState();
// }

// class _EditDbUserScreenState extends State<EditDbUserScreen> {
//   late TextEditingController nameController;
//   late TextEditingController ageController;
//   late TextEditingController genderController;
//   late TextEditingController emailController;
//   late TextEditingController specialityController;
//   late TextEditingController ratingController;
//   late TextEditingController phoneController;
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.user['name']);
//     ageController = TextEditingController(text: widget.user['age']);
//     genderController = TextEditingController(text: widget.user['gender']);
//     emailController = TextEditingController(text: widget.user['email']);
//     specialityController = TextEditingController(text: widget.user['speciality']);
//     ratingController = TextEditingController(text: widget.user['rating']);
//     phoneController = TextEditingController(text: widget.user['phone']);
//   }
//   @override
//   void dispose() {
//     nameController.dispose();
//     ageController.dispose();
//     genderController.dispose();
//     emailController.dispose();
//     specialityController.dispose();
//     ratingController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }
//   void saveUser() {
//     final updatedUser = {
//       'name': nameController.text,
//       'age': ageController.text,
//       'gender': genderController.text,
//       'email': emailController.text,
//       'speciality': specialityController.text,
//       'rating': ratingController.text,
//       'phone': phoneController.text,
//       'imageUrl': widget.user['imageUrl']!, // Keep existing image
//     };
//     widget.onSave(updatedUser); // Pass updated data back to the parent
//     Navigator.pop(context);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit User', style: TextStyle(color: Colors.white, fontSize: 23)),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: Color.fromRGBO(38, 43, 106, 1),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               // Profile Image with Edit Icon
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 60,
//                     backgroundImage: NetworkImage(widget.user['imageUrl']!),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                           ),
//                           builder: (context) {
//                             return Wrap(
//                               children: [
//                                 ListTile(
//                                   leading: Icon(Icons.photo_library),
//                                   title: Text('Choose from Gallery'),
//                                   onTap: () {
//                                     // Add gallery selection logic
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                                 ListTile(
//                                   leading: Icon(Icons.camera_alt),
//                                   title: Text('Take Picture'),
//                                   onTap: () {
//                                     // Add camera logic
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       child: CircleAvatar(
//                         radius: 16,
//                         backgroundColor: Colors.blue,
//                         child: Icon(Icons.edit, size: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Form Fields
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: ageController,
//                 decoration: InputDecoration(labelText: 'Age'),
//               ),
//               TextField(
//                 controller: genderController,
//                 decoration: InputDecoration(labelText: 'Gender'),
//               ),
//               TextField(
//                 controller: specialityController,
//                 decoration: InputDecoration(labelText: 'Speciality'),
//               ),
//               TextField(
//                 controller: ratingController,
//                 decoration: InputDecoration(labelText: 'Rating'),
//               ),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(labelText: 'Phone'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: saveUser,
//                 child: Text(
//                   'Save',
//                   style: TextStyle(color: Color.fromRGBO(38, 43, 106, 1)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
  late TextEditingController specialityController;
  late TextEditingController ratingController;
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user['name']);
    ageController = TextEditingController(text: widget.user['age']);
    genderController = TextEditingController(text: widget.user['gender']);
    emailController = TextEditingController(text: widget.user['email']);
    specialityController =
        TextEditingController(text: widget.user['speciality']);
    ratingController = TextEditingController(text: widget.user['rating']);
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
              controller: specialityController,
              decoration: InputDecoration(labelText: 'Speciality'),
            ),
            TextField(
              controller: ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // TextField(
            //   controller: phoneController,
            //   decoration: InputDecoration(labelText: 'Phone'),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedUser = {
                  'name': nameController.text,
                  'age': ageController.text,
                  'gender': genderController.text,
                  'email': emailController.text,
                  'speciality': specialityController.text,
                  'rating': ratingController.text,
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

  final List<Map<String, String>> appointedPatients = [
    {
      'name': 'John Doe',
      'specialty': 'General fever',
      'date': '2024-10-05',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.srNFFzORAaERcWvhwgPzVAHaHa&pid=Api&P=0&h=220'
    },
    {
      'name': 'Emily Johnson',
      'specialty': 'Chest pain',
      'date': '2024-09-20',
      'imageUrl':
          'https://tse4.mm.bing.net/th?id=OIP.WpnGIPj1DKAGo-CP64znTwHaHa&pid=Api&P=0&h=220'
    },
    {
      'name': 'Jane Smith',
      'specialty': 'Ankle Sprain',
      'date': '2024-09-15',
      'imageUrl':
          'https://tse1.mm.bing.net/th?id=OIP.PqBYGErQeWQWhbA_VeUBDQHaHa&pid=Api&P=0&h=220'
    },
  ];

  DetailViewScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Details',
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
                  _buildInfoRow('Speciality', user['speciality']!),
                  _buildInfoRow('Rating', user['rating']!),
                  _buildInfoRow('Email', user['email']!),
                  // _buildInfoRow('Phone', user['phone']!),
                ],
              ),
            ),
            SizedBox(height: 20),
            // History of Booked Doctors Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recently Appointed',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ),
            _buildAppointedPatients(),
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

  // Widget to display the list of booked doctors
  Widget _buildAppointedPatients() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: appointedPatients.length,
      itemBuilder: (context, index) {
        final doctor = appointedPatients[index];
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
                      Text('Date: ${doctor['date']}'),
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

class AddDoctorScreen extends StatefulWidget {
  @override
  _AddDoctorScreenState createState() => _AddDoctorScreenState();
}

class _AddDoctorScreenState extends State<AddDoctorScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _specialityController = TextEditingController();
  final _ratingController = TextEditingController();
  final _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Doctor',
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
                decoration: InputDecoration(labelText: 'Doctor Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _specialityController,
                decoration: InputDecoration(labelText: 'Speciality'),
              ),
              TextField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final newDoctor = {
                    'name': _nameController.text,
                    'age': _ageController.text,
                    'gender': _genderController.text,
                    'email': _emailController.text,
                    'phone': _phoneController.text,
                    'speciality': _specialityController.text,
                    'rating': _ratingController.text,
                    'imageUrl': _imageUrlController.text,
                  };
                  Navigator.pop(context, newDoctor);
                },
                child: Text('Add Doctor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
