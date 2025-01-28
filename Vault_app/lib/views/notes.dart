import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Notes extends StatefulWidget {
  String routeName = "/notes";
  Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> with SingleTickerProviderStateMixin {
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
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'Notes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().bottomBar,
              (route) => false,
              arguments: 2, // Pass the _selectedIndex value as an argument
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  // Routes().signUp,
                  Routes().notes_AddEdit,
                  (route) => false,
                );
              },
            ),
          ),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCustomCard(
              context,
              title: 'Card 1',
              content: 'This is some content for card 1.',
            ),
            SizedBox(height: 20),
            _buildCustomCard(
              context,
              title: 'Card 2',
              content: 'This card has a bit more content than the first one.',
            ),
            SizedBox(height: 20),
            _buildCustomCard(
              context,
              title: 'Card 3',
              content:
                  'This is card 3 with even more content, it is supposed to be larger than the others.',
            ),
            SizedBox(height: 20),
            _buildCustomCard(
              context,
              title: 'Card 4',
              content: 'Short content.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCard(BuildContext context,
      {required String title, required String content}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes().notes_AddEdit,
          (route) => false,
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Today 00:00AM',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
