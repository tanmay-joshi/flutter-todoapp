import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './task.dart';
import './model.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTask createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  final taskTitleController = TextEditingController();
  final Task task = Task(title: "", completed: false);

  void addNow() {
    final String textVal = taskTitleController.text.toString();
    final Task task = Task(title: textVal, completed: false);

    Provider.of<Model>(context).addTask(task);
    Provider.of<Model>(context).addDate(task);
    taskTitleController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Flexible(
            child: TextField(
          controller: taskTitleController,
          onSubmitted: (text) {
            addNow();
          },
        )),
        RaisedButton(
          padding: EdgeInsets.all(12),
          child: Text("+"),
          onPressed: addNow,
        )
      ],
    ));
  }
}
