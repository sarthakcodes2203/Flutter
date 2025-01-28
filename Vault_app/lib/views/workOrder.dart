import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pro_vault/routes/routes.dart';

class Workorder extends StatefulWidget {
  String routeName = "/workOrder";
  Workorder({super.key});

  @override
  State<Workorder> createState() => _WorkorderState();
}

class _WorkorderState extends State<Workorder>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Add your back button functionality here
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
          ),
          child: Text(
            'Work Order',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent, // Remove default indicator
          tabs: [
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: _tabController.index == 0 ? Colors.white : Colors.cyan,
                ),
                child: Center(
                  child: Text(
                    'Current',
                    style: TextStyle(
                      fontSize: 18,
                      color: _tabController.index == 0
                          ? Colors.cyan
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: _tabController.index == 1 ? Colors.white : Colors.cyan,
                ),
                child: Center(
                  child: Text(
                    'Past',
                    style: TextStyle(
                      fontSize: 18,
                      color: _tabController.index == 1
                          ? Colors.cyan
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.cyan,
      ),
      body: TabBarView(
        physics:NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          // Current Tab
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Light Fitting',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Problem faced to switch on off...',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'on 23rd Dec 2024',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 7),
                              StatusTag(
                                  status: index == 0 ? 'Pending' : 'Running',
                                  color: index == 0
                                      ? Colors.orange
                                      : Color.fromARGB(255, 189, 175, 44)),
                            ],
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              // Routes().signUp,
                              Routes().orderDetails,
                              (route) => false,
                            );
                          },
                          child: Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),

          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //   ),
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(
          //           FontAwesomeIcons.folderOpen,
          //           size: 70,
          //           color: Colors.cyan,
          //         ),
          //         SizedBox(height: 12),
          //         Text(
          //           'No Record Found',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          // // Past Tab
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Light Fitting',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Problem faced to switch on off...',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                'on 23rd Dec 2024',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey),
                              ),
                              SizedBox(width: 7),
                              StatusTag(
                                  status: index == 0
                                      ? 'Completed'
                                      : 'Not Completed',
                                  color:
                                      index == 0 ? Colors.green : Colors.red),
                            ],
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              // Routes().signUp,
                              Routes().orderDetails,
                              (route) => false,
                            );
                          },
                          child: Icon(Icons.arrow_forward_ios, size: 18)),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StatusTag extends StatelessWidget {
  final String status;
  final Color color;

  StatusTag({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
