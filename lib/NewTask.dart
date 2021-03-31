import 'package:flutter/material.dart';
import 'package:inq/HomePage.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: NewTaske(),
    );
  }
}

class NewTaske extends StatefulWidget {
  @override
  _NewTaskeState createState() => _NewTaskeState();
}

class _NewTaskeState extends State<NewTaske> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffB8336A),
        elevation: 0,
        title: Text(
          "New Task",
          style: TextStyle(fontSize: 28),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 30,
              color: Color(0xffB8336A),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Title", border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey.withOpacity(0.2),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Due Date",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xffB8336A)),
                        child: Center(
                          child: Text(
                            "Add Task",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
