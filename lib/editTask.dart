// import 'package:flutter/material.dart';
// import 'package:inq/HomePage.dart';
// import 'task.dart';

// class EditTask extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'avenir'),
//       home: NewTaske(),
//     );
//   }
// }


// class NewTaske extends StatefulWidget {

//   @override
//   NewTaskeState createState() => NewTaskeState();
// }

// class NewTaskeState extends State<NewTaske> {
//   final titleController = TextEditingController();

//   DateTime selectedDate;

//   void _addNewTodo(String title, DateTime date) {
//     final newtodo = Task(
//       id: DateTime.now().toString(),
//       title: title,
//       date: date,
//     );
//     setState(() {
//       tasks.add(newtodo);
//     });
//   }

//   var monthNames = [
//     "JAN",
//     "FEB",
//     "MAR",
//     "APR",
//     "MAY",
//     "JUN",
//     "JUL",
//     "AUG",
//     "SEPT",
//     "OCT",
//     "NOV",
//     "DEC"
//   ];

//   void datepick() {
//     showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(2019),
//             lastDate: DateTime(2050))
//         .then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       }
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Color(0xffB8336A),
//         elevation: 0,
//         title: Text(
//           "New Task",
//           style: TextStyle(fontSize: 28),
//         ),
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()));
//           },
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             Container(
//               height: 30,
//               color: Color(0xffB8336A),
//             ),
//             Positioned(
//               bottom: 0,
//               child: Container(
//                 height: 70,
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.black.withOpacity(0.8),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 30),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(7)),
//                   color: Colors.white),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * 0.85,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       color: Colors.grey.withOpacity(0.2),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             hintText: "Title", border: InputBorder.none),
//                         style: TextStyle(fontSize: 18),
//                         controller: titleController,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         children: <Widget>[
//                           Expanded(
//                             child : Text(selectedDate == null
//                                 ? "No Due Date Choosen"
//                                 : "${monthNames[selectedDate.month - 1]}, ${selectedDate.day}/${selectedDate.year}"),
//                           ),
//                           TextButton(
//                               onPressed: datepick,
//                               child: Text(
//                                 'Choose Date',
//                                 style: TextStyle(
//                                     color: Color(0xffB8336A),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold),
//                               ))
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           // print(titleInput);
//                           _addNewTodo(titleController.text, selectedDate);
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => HomePage()));
//                         },
//                         style: ButtonStyle(
//                           // padding: EdgeInsets.symmetric(vertical: 15),
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                               Color(0xffB8336A)),
//                           // backgroundColor: Color(0xffB8336A),
//                         ),
//                         child: Text(
//                           'Add Todo',
//                           style: TextStyle(color: Colors.white, fontSize: 18),
//                         )),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
