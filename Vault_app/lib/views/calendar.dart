import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pro_vault/extensions.dart';

class Calendar extends StatefulWidget {
    String routeName = "/calender";
Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  int _firstDayOfWeek(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }

  int daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int firstDayOfWeek = _firstDayOfWeek(_currentDate);
    int daysInCurrentMonth = daysInMonth(_currentDate);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Text(
            'Calendar',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(
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
      body: 
      SingleChildScrollView(
        child: 
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        _currentDate = DateTime(
                            _currentDate.year, _currentDate.month - 1, 1);
                      });
                    },
                  ),
                  Text(
                    '${DateFormat('MMMM').format(_currentDate)} ${_currentDate.year}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      setState(() {
                        _currentDate = DateTime(
                            _currentDate.year, _currentDate.month + 1, 1);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Sun', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Mon', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Tue', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Wed', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Thu', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Fri', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Sat', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              // Expanded(
              //   child:
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                // itemCount: firstDayOfWeek + daysInCurrentMonth,
                itemCount: 42,
                itemBuilder: (context, index) {
                  // int firstDayOfWeek = _firstDayOfWeek(_currentDate);
                  // int daysInCurrentMonth = daysInMonth(_currentDate);
                  int day = index - firstDayOfWeek + 1;

                  DateTime date;
                  TextStyle textStyle;

                  if (day < 1) {
                    int daysInPreviousMonth = daysInMonth(
                        DateTime(_currentDate.year, _currentDate.month - 1));
                    date = DateTime(_currentDate.year, _currentDate.month - 1,
                        daysInPreviousMonth + day);
                    textStyle = const TextStyle(
                        color: Colors
                            .grey); // Grey color for previous month's dates
                  } else if (day > daysInCurrentMonth) {
                    date = DateTime(_currentDate.year, _currentDate.month + 1,
                        day - daysInCurrentMonth);
                    textStyle = const TextStyle(
                        color:
                            Colors.grey); // Grey color for next month's dates
                  } else {
                    date = DateTime(_currentDate.year, _currentDate.month, day);
                    textStyle =
                        const TextStyle(color: Colors.black); // Default color
                  }

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey),
                        color: date == DateTime.now().dateOnly
                            ? Colors.green // Green color for today's date
                            : (_selectedDate == date
                                ? Colors.cyan
                                : Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: textStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 22),
                child: Text(
                  DateTime.now().todaysDate,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child:
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
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
                                    status:
                                        index == 0 ? 'In Progress' : 'Running',
                                    color: index == 0
                                        ? Colors.orange
                                        : Color.fromARGB(255, 189, 175, 44)),
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
              // ),

              // Container(
              //   margin: EdgeInsets.only(top: 56),
              //   decoration: BoxDecoration(
              //     // color: Colors.white,
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
            ],
          ),
        ),
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
