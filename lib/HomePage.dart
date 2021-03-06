// This is the home Page for the inq app
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_calendar/table_calendar.dart';
import 'NewTask.dart';
// import 'task.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
        primarySwatch: Colors.blue,
      ),
      home: HomePagee(),
    );
  }
}

class HomePagee extends StatefulWidget {
  @override
  _HomePageeState createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  String filterType = "today";
  DateTime today = new DateTime.now();
  // String taskPop = "close";
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEPT",
    "OCT",
    "NOV",
    "DEC"
  ];
  // final List<Task> tasks = [
  //   Task(id: 't1', title: 'HVCO Poster', date: DateTime.now()),
  //   Task(id: 't2', title: 'SE APP Development', date: DateTime.now()),
  //   Task(id: 't3', title: 'Java Lab', date: DateTime.now()),
  // ];
  NewTaske mlist = new NewTaske('123', 0);
  // final List<Task> tasks;
  // tasks = mlist.getList() ;

  CalendarController ctrlr = new CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                // toolbarHeight: 45,
                backgroundColor: Color(0xffB8336A),
                title: Text(
                  "Task List",
                  style: TextStyle(fontSize: 28),
                ),
                actions: [
                  IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.short_text,
                        color: Color(0xfffcfcfc),
                        size: 30,
                      ))
                ],
              ),
              Container(
                height: 55,
                color: Color(0xffB8336A),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("today");
                          },
                          child: Text(
                            "Today",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 5,
                          width: 120,
                          decoration: BoxDecoration(
                              color: (filterType == "today")
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter("monthly");
                          },
                          child: Text(
                            "Monthly",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          decoration: BoxDecoration(
                              color: (filterType == "monthly")
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              (filterType == "monthly")
                  ? TableCalendar(
                      calendarController: ctrlr,
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      initialCalendarFormat: CalendarFormat.week,
                    )
                  : Container(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: mlist.getList().map((tx) {
                            if (filterType == "monthly" &&
                                tx.date.month == DateTime.now().month) {
                              return taskWidget(
                                tx.id,
                                Color((Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(1.0),
                                tx.title,
                                "${monthNames[tx.date.month - 1]}, ${tx.date.day}/${tx.date.year}",
                              );
                            }
                            if (filterType == "today" &&
                                tx.date.month == DateTime.now().month &&
                                tx.date.day == DateTime.now().day &&
                                tx.date.year == DateTime.now().year) {
                              return taskWidget(
                                tx.id,
                                Color((Random().nextDouble() * 0xFFFFFF)
                                        .toInt())
                                    .withOpacity(1.0),
                                tx.title,
                                "${monthNames[tx.date.month - 1]}, ${tx.date.day}/${tx.date.year}",
                              );
                            }
                            return Container();
                          }).toList(),
                        ),
                      ]),
                ),
              ),
              Container(
                height: 100,
                child: Center(
                  child: InkWell(
                    onTap: openNewTask,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(0xffB8336A), shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  changeFilter(String filter) {
    filterType = filter;
    setState(() {});
  }

  Slidable taskWidget(String id, Color color, String title, String time) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1)
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 4)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 5,
              color: color,
            )
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: "Edit",
          color: Colors.white,
          icon: Icons.edit,
          onTap: () => edi(id),
          // here we need to add the function for edditing the list
        ),
        IconSlideAction(
          caption: "Delete",
          color: color,
          icon: Icons.edit,
          onTap: () => del(id),
        )
      ],
    );
  }

  void edi(String id) {
    setState(() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => NewTask(id, 1)));
    });
  }

  void del(String id) {
    setState(() {
      tasks.removeWhere((element) => element.id == id);
    });
  }

  openNewTask() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewTask(DateTime.now().toString(), 0)));
  }
}
