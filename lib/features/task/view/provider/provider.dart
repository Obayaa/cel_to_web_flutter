import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:to_do_app/features/task/domain/data/task_model.dart';
import 'package:to_do_app/features/task/domain/repository/task_repo.dart';

class TaskProvider extends ChangeNotifier {
  //creating instance of repo
  final TaskRepo _repo;

  TaskProvider(this._repo);

  static List<TaskModel> _taskModel = [];
  static List<TaskModel> _task = [];
  List<TaskModel> get taskModel => _taskModel;

  //function to add task
  void addTask(String title, String description) async {
    log('hello I got here');
    await _repo.addTask(title, description);
    notifyListeners();
  }

  Stream getTasks() async* {
    var response = await _repo.getTasks();
    log("response $response");

    _taskModel = List.from(response.value);
    yield _taskModel;
    // notifyListeners();
  }

  void deleteTask(int id) async {
    await _repo.deleteTask(id);
    notifyListeners();
  }

  //Update
  void updateTask(String title, String description, int id) async {
    await _repo.updateTask(title, description, id);
    notifyListeners();
  }

  void getTask(int id) async {
    var response = await _repo.getTask(id);

    _task = List.from(response.value);
    notifyListeners();
  }
}
