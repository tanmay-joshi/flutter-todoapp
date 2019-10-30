import 'package:flutter/material.dart';

import './task.dart';
import './taskListItem.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildren(),
    );
  }

  getChildren() {
    return tasks.map((f) => TaskListItem(f)).toList();
  }
}
