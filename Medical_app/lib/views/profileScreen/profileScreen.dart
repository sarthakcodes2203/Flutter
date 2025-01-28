import 'package:flutter/material.dart';
import 'package:my_app/routing/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profilescreen extends StatefulWidget {
  String routeName = "/profileScreen";
  Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen>
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
        title: Text(
          'Profile',
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
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().mainScreen,
              (route) => false,
            );
          },
        ),
        backgroundColor: Color.fromRGBO(38, 43, 106, 1),
      ),
      body: Column(
        children: [
          _buildHeader(
            profileImagePath:
                'assets/profile/dp.jpg',
            name: 'Sarthak Chakraborty',
            heartRate: '215bpm',
            calories: '756cal',
            weight: '103lbs',
          ),

          // _buildHeader(context),
          _buildMenuOptions(context),
        ],
      ),
    );
  }
}

Widget _buildHeader({
  required String profileImagePath,
  required String name,
  required String heartRate,
  required String calories,
  required String weight,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    decoration: BoxDecoration(
      color: Color.fromRGBO(38, 43, 106, 1),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(profileImagePath),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatColumn(heartRate, 'Heart rate'),
            _buildStatColumn(calories, 'Calories'),
            _buildStatColumn(weight, 'Weight'),
          ],
        ),
      ],
    ),
  );
}

// Widget _buildHeader(BuildContext context) {
//   return FutureBuilder<DocumentSnapshot>(
//     future: FirebaseFirestore.instance.collection('users').doc('user1').get(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(child: CircularProgressIndicator());
//       } else if (snapshot.hasError) {
//         return Center(child: Text("Error loading data"));
//       } else if (!snapshot.hasData || !snapshot.data!.exists) {
//         return Center(child: Text("No data available"));
//       } else {
//         var data = snapshot.data!.data() as Map<String, dynamic>;
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//           decoration: BoxDecoration(
//             color: Color.fromRGBO(38, 43, 106, 1),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//             ),
//           ),
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 55,
//                 backgroundImage: AssetImage('assets/profile/dp.jpg'),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 data['name'] ?? 'No name',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildStatColumn(data['heartRate'] ?? '0bpm', 'Heart rate'),
//                   _buildStatColumn(data['calories'] ?? '0cal', 'Calories'),
//                   _buildStatColumn(data['weight'] ?? '0lbs', 'Weight'),
//                 ],
//               ),
//             ],
//           ),
//         );
//       }
//     },
//   );
// }

Widget _buildStatColumn(String value, String label) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      Text(
        label,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 12,
        ),
      ),
    ],
  );
}

Widget _buildMenuOptions(BuildContext context) {
  return Expanded(
    child: ListView(
      children: [
        ListTile(
          leading: Icon(Icons.favorite, color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'My Saved',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle menu item tap
          },
        ),
        ListTile(
          leading:
              Icon(Icons.calendar_today, color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'Appointment',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            //  Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   // Routes().ciHome,
            //   Routes().loggedOut,
            //   (route) => false,
            // );
          },
        ),
        ListTile(
          leading: Icon(Icons.payment, color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'Payment Method',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle menu item tap
          },
        ),
        ListTile(
          leading: Icon(Icons.question_answer,
              color: Color.fromRGBO(38, 43, 106, 1)),
          title: Text(
            'FAQs',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle menu item tap
          },
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().loggedOut,
              (route) => false,
            );
          },
          child: ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            // onTap: () {
            //  Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   // Routes().ciHome,
            //   Routes().loggedOut,
            //   (route) => false,
            // );
            // },
          ),
        )
      ],
    ),
  );
}
