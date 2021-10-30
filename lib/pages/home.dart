import 'package:courses/DBHelper.dart';
import 'package:courses/Models/Course.dart';
import 'package:courses/Pages/AddCourse.dart';
import 'package:flutter/material.dart';

import 'EditCourse.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text("Courses"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                final value = await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AddCourse();
                  },
                ));
              })
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: helper.allCorurses(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Course course = Course.fromMap(snapshot.data[index]);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return EditCourse(
                            idFromdatabase: snapshot.data[index]['id'],
                          );
                        },
                      ));
                    },
                    child: ListTile(
                      title:
                          Text('${course.name} Course - hours ${course.hours}'),
                      subtitle: Text("${course.decribtion}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            helper.delete(snapshot.data[index]['id']);
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
