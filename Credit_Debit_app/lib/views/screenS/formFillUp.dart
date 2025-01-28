import 'package:Accountings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Formfillup extends StatefulWidget {
  Formfillup({super.key});
  String routeName = "/formFillUp";

  @override
  State<Formfillup> createState() => _FormfillupState();
}

class _FormfillupState extends State<Formfillup>
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Navigator.pop(context)
            // Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().ciHome,
              Routes().settings,
              (route) => false,
            );

            // Add your back button functionality here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create Khatabook',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                // Icon(FontAwesomeIcons.floppyDisk)
                Text(
                  'Save',
                  style: TextStyle(
                      color: Color.fromARGB(255, 124, 124, 124),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 6),
            Divider(),
            SizedBox(height: 14),
            _buildTextField(Icons.person, 'Full Name'),
            _buildTextField(Icons.phone, 'Phone Number'),
            _buildTextField(Icons.home, 'Address'),
            SizedBox(height: 16),
            Text('Credit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 24),
              child: Row(
                children: [
                  Icon(Icons.currency_rupee),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Rs 0.',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildMoreTransactionRow('Rs 0.', 'Description'),
            SizedBox(height: 16),
            Text('Debit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 24),
              child: Row(
                children: [
                  Icon(Icons.currency_rupee),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Rs 0.',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildMoreTransactionRow('Rs 0.', 'Description'),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.balance,
                  size: 28,
                  color: Color.fromARGB(255, 112, 112, 112),
                ),
                Text('Balance',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style: TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text('10,000',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreTransactionRow(
    String amountHint,
    String descriptionHint,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.currency_rupee),
          SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: amountHint,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: descriptionHint,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 12),
          Container(
            width: 26, // Same size as the default FloatingActionButton
            height: 26,
            decoration: BoxDecoration(
              color: const Color.fromARGB(210, 121, 85, 72), // Background color
              shape: BoxShape.circle, // Circular shape
            ),
            child: InkWell(
              onTap: () {
                // Add your code here to handle the button press
              },
              customBorder: CircleBorder(), // Ensure the touch area is round
              child: Center(
                child:
                    Icon(Icons.add, size: 16, color: Colors.white), // The icon
              ),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Container(
            width: 26, // Same size as the default FloatingActionButton
            height: 26,
            decoration: BoxDecoration(
              color: const Color.fromARGB(210, 121, 85, 72), // Background color
              shape: BoxShape.circle, // Circular shape
            ),
            child: InkWell(
              onTap: () {
                // Add your code here to handle the button press
              },
              customBorder: CircleBorder(), // Ensure the touch area is round
              child: Center(
                child: Icon(FontAwesomeIcons.minus,
                    size: 16, color: Colors.white), // The icon
              ),
            ),
          ),

          // IconButton(
          //   icon: Icon(Icons.remove_circle_outline),
          //   onPressed: () {
          //     // Remove action
          //   },
          // ),
        ],
      ),
    );
  }
}
