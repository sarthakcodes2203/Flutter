import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/routes/routes.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});
  String routeName = "/mainPage";

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage>
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

  String _selectedAlphabet = '';
  Timer? _timer;
  bool _yearly = false;
  bool _monthly = false;
  bool _weekly = false;

  // Dynamic to-do list data
  List<Map<String, dynamic>> todoList = [
    {
      'title': 'Buy groceries',
      'description': 'Milk, Bread, Eggs',
      'done': false
    },
    {
      'title': 'Walk the dog',
      'description': 'Take the dog for a walk at 5 PM',
      'done': false
    },
    {'title': 'Call mom', 'description': 'Check in with mom', 'done': true},
  ];

  void _addTodo() {
    setState(() {
      todoList.add({
        'title': 'New task',
        'description': 'Task description',
        'done': false
      });
    });
  }

  void _addTododb() {
    fetchData.add({
      'title': 'New task', // Default title for new task
      'description': 'Task description', // Default description
      'done': false, // Default state
      'created_at': FieldValue.serverTimestamp(), // Optional: Add a timestamp
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task added successfully!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add task: $error')),
      );
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void _deleteTododb(String id) {
    fetchData.doc(id).delete();
  }

  void _toggleDone(int index) {
    setState(() {
      todoList[index]['done'] = !todoList[index]['done'];
    });
  }

  final CollectionReference fetchData =
      FirebaseFirestore.instance.collection("data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes().settings,
              (route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes().profile,
                      (route) => false,
                    );
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/dp.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.notifications, size: 28),
                    ),
                    SizedBox(width: 6),
                    GestureDetector(
                      // onTap: () {
                      //   Navigator.pushNamedAndRemoveUntil(
                      //     context,
                      //     Routes().profile,
                      //     (route) => false,
                      //   );
                      // },
                      child: Icon(Icons.menu, size: 28),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            Divider(color: Colors.black, thickness: 1),
            SizedBox(height: 10),

            // To-do list UI
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: todoList[index]['done'],
                        onChanged: (value) {
                          _toggleDone(index);
                        },
                      ),
                      title: Text(todoList[index]['title']),
                      subtitle: Text(todoList[index]['description']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditDialog(context,
                                  index); // Pass the index of the to-do item
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteTodo(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Divider(color: Colors.black, thickness: 1),
            
            // To-do list UI---fom firestore database
            // StreamBuilder(
            //     stream: fetchData.snapshots(),
            //     builder:
            //         (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            //       if (streamSnapshot.hasData) {
            //         return ListView.builder(
            //             itemCount: streamSnapshot.data!.docs.length,
            //             itemBuilder: (context, index) {
            //               final DocumentSnapshot documentSnapshot =
            //                   streamSnapshot.data!.docs[index];
            //               return Material(
            //                 child: ListTile(
            //                   title: Text(documentSnapshot['title'],),
            //                 ),
            //               );
            //             });
            //       }
            //       return Center(
            //         child: const CircularProgressIndicator(),
            //       );
            //     }),

            Expanded(
              child: StreamBuilder(
                stream: fetchData.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (streamSnapshot.hasError) {
                    return Center(
                        child: Text('Error: ${streamSnapshot.error}'));
                  }
                  if (!streamSnapshot.hasData ||
                      streamSnapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No tasks available.'));
                  }

                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final documentSnapshot = streamSnapshot.data!.docs[index];
                      final data =
                          documentSnapshot.data() as Map<String, dynamic>;
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ListTile(
                          leading: Checkbox(
                            value: data['done'] ??
                                false, // Assuming 'done' field is in Firestore
                            onChanged: (value) {
                              // Update Firestore with the new value
                              fetchData
                                  .doc(documentSnapshot.id)
                                  .update({'done': value});
                            },
                          ),
                          title: Text(data['title'] ?? 'No Title'),
                          subtitle:
                              Text(data['description'] ?? 'No Description'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _showEditDialogdb(context,
                                      documentSnapshot); // Custom edit dialog
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  _deleteTododb(documentSnapshot
                                      .id); // Function to delete from Firestore
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Add new task button
            ElevatedButton(
              onPressed: _addTodo,
              child: Text("Add New Task"),
            ),
            ElevatedButton(
              onPressed: _addTododb,
              child: Text("Add New Task To Database"),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    TextEditingController titleController =
        TextEditingController(text: todoList[index]['title']);
    TextEditingController descriptionController =
        TextEditingController(text: todoList[index]['description']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit To-Do'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Update the real data in todoList
                  todoList[index]['title'] = titleController.text;
                  todoList[index]['description'] = descriptionController.text;
                });
                Navigator.of(context).pop(); // Close the dialog after saving
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialogdb(
      BuildContext context, DocumentSnapshot documentSnapshot) {
    final titleController =
        TextEditingController(text: documentSnapshot['title']);
    final descriptionController =
        TextEditingController(text: documentSnapshot['description']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                fetchData.doc(documentSnapshot.id).update({
                  'title': titleController.text,
                  'description': descriptionController.text,
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
