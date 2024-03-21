import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/features/task/domain/repository/task_repo.dart';

class TaskProvider extends ChangeNotifier {
  //creating instance of repo
  final TaskRepo _repo;

  TaskProvider(this._repo);

  static List _taskModel = [];
  List get taskModel => _taskModel;

  //function to add task
  void addTask(String title, String description) {
    log('hello I got here');
    _repo.addTask(title, description);
    notifyListeners();
  }

  void getTasks() {
    _repo.getTasks();
    notifyListeners();
  }
}
