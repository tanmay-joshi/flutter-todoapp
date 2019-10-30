import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:demo_app/model.dart';

import './taskList.dart';
import './addTask.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MediaQuery(
        data: new MediaQueryData(),
        child: MaterialApp(
          home: ChangeNotifierProvider(
              builder: (context) => Model(),
              child: Scaffold(
                  appBar: AppBar(
                    title: Text("To-do List"),
                  ),
                  body: ListView(
                    children: <Widget>[
                      SizedBox(
                        child: Consumer<Model>(
                          builder: (context, tasks, child) =>
                              TaskList(tasks.allTasks),
                        ),
                        height: 400,
                      ),
                      AddTask()
                    ],
                  ))),
        ));
  }
}
