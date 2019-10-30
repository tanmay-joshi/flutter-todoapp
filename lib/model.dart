import 'dart:collection';

import 'package:flutter/material.dart';

import './task.dart';

class Model with ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: "Design", dateTime: DateTime.now()),
    Task(title: "Develop", dateTime: DateTime.now())
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);

  bool completedState(Task task) {
    return task.completed;
  }

  void addDate(Task task) {
    task.dateTime = DateTime.now();
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.completed = !task.completed;
    notifyListeners();
  }
}
