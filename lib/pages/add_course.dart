import 'package:courses/db_helper.dart';
import 'package:courses/models/course.dart';
import 'package:courses/pages/home.dart';
import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {
  AddCourse({Key key}) : super(key: key);

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  String name, dicription;
  int hours;
  DBHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Hours',
                hintText: 'Enter Hours',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onChanged: (value) {
              setState(() {
                hours = int.parse(value);
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Describtion',
                hintText: 'Enter Describtion',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            maxLines: 4,
            onChanged: (value) {
              setState(() {
                dicription = value;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            onPressed: () async {
              Course course = Course(
                  {'name': name, 'decribtion': dicription, 'hours': hours});
              int id = await helper.createCourse(course);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}
