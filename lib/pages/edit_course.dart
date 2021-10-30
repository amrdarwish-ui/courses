import 'package:courses/models/course.dart';
import 'package:flutter/material.dart';

class EditCourse extends StatefulWidget {
  int idFromdatabase;
  EditCourse({Key key, @required this.idFromdatabase}) : super(key: key);

  @override
  _EditCourseState createState() =>
      _EditCourseState(idFromdatabase: idFromdatabase);
}

class _EditCourseState extends State<EditCourse> {
  _EditCourseState({@required this.idFromdatabase});
  String name, dicription;
  int hours, idFromdatabase, id;
  DBHelper helper;
  @override
  void initState() {
    super.initState();
    id = idFromdatabase;
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
              Course course = Course({
                'id': id,
                'name': name,
                'decribtion': dicription,
                'hours': hours
              });
              int id0 = await helper.update(course);
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
