import 'package:demo_app/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './task.dart';
import './model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  TaskListItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Provider.of<Model>(context, listen: false).toggleTask(task);
        },
        leading: Checkbox(
          value: Provider.of<Model>(context).completedState(task),
          onChanged: (bool) {
            Provider.of<Model>(context, listen: false).toggleTask(task);
            print(task.completed);
          },
        ),
        title: Column(
          children: <Widget>[
            Text(task.title,
                style: task.completed
                    ? TextStyle(decoration: TextDecoration.lineThrough)
                    : TextStyle(color: Colors.black)),
            Text(
              (task.dateTime).toString(),
              style: TextStyle(fontSize: 10, color: Colors.blueGrey),
            )
          ],
        ),
        trailing: RaisedButton(
            textColor: Colors.redAccent[100],
            color: Colors.white,
            elevation: 0,
            padding: EdgeInsets.all(0),
            onPressed: () {
              Provider.of<Model>(context).deleteTask(task);
            },
            child: Icon(
              Icons.delete,
              size: 20,
            )),
      ),
      elevation: 2,
    );
  }
}
