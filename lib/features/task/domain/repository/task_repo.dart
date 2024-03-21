import 'package:to_do_app/common/data/result.dart';

abstract class TaskRepo {
  //get Task
  Future<Results> getTask();
  //get Tasks
  Future<Results> getTasks();
  //Add Task
  Future<Results> addTask(String title, String description);
  //Update the task
  Future<Results> updateTask();
  //Delete Task
  Future<Results> deleteTask();
}
