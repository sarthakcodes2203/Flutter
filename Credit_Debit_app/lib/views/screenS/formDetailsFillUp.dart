import 'package:Accountings/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Formdetailsfillup extends StatefulWidget {
  Formdetailsfillup({super.key});
  String routeName = "/formDetailsFillUp";

  @override
  State<Formdetailsfillup> createState() => _FormdetailsfillupState();
}

class _FormdetailsfillupState extends State<Formdetailsfillup>
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
            // Add your back button functionality here
            Navigator.pushNamedAndRemoveUntil(
              context,
              // Routes().ciHome,
              Routes().mainPage,
              (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Abcd Details Khatabook',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(FontAwesomeIcons.penToSquare)
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
              _buildMoreTransactionRow('Rs 0.', 'Description'),
              _buildMoreTransactionRow('Rs 0.', 'Description'),
              SizedBox(height: 16),
              Text('Debit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              _buildMoreTransactionRow('Rs 0.', 'Description'),
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
          SizedBox(width: 4),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: amountHint,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 12),
          Icon(
            FontAwesomeIcons.rectangleList,
            size: 16,
          ),
          SizedBox(width: 6),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: descriptionHint,
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
