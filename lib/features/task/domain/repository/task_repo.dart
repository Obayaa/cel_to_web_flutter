import 'package:to_do_app/common/data/result.dart';

abstract class TaskRepo {
  //get Task
  Future<Results> getTask(int id);
  //get Tasks
  Future<Results> getTasks();
  //Add Task
  Future<Results> addTask(String title, String description);
  //Update the task
  Future<Results> updateTask(String title, String description, int id);
  //Delete Task
  Future<Results> deleteTask(int id);
}
