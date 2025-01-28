import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class NotesAddEdit extends StatefulWidget {
    String routeName = "/notes_AddEdit";
NotesAddEdit({super.key});

  @override
  State<NotesAddEdit> createState() => _NotesAddEditState();
}

class _NotesAddEditState extends State<NotesAddEdit>
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
        title: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            'Add / Edit Notes',
            // 'Edit Notes',
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
              // Routes().signUp,
              Routes().notes,
              (route) => false,
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
                Icons.check,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          expands: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: InputBorder.none, // No decoration
          ),
        ),
      ),
    );
  }
}
