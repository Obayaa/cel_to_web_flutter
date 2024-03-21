import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/common/data/result.dart';
import 'package:to_do_app/database/db.dart';
import 'package:to_do_app/features/task/domain/data/task_model.dart';
import 'package:to_do_app/features/task/domain/repository/task_repo.dart';

//local source repo implementation
class LocalSourceRepoImplementation extends TaskRepo {
  @override
  Future<Results> addTask(String title, String description) async {
    try {
      final db = await SQLHelper.instance.database;
      Map<String, String> values = {
        "title": title,
        "description": description,
      };
      final response = await db?.insert(
        SQLHelper.tableName,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      log('Response: $response');
      return Success(value: response);
    } catch (e) {
      return Failed(value: e);
    }
  }

  @override
  Future<Results> deleteTask() {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Results> getTask() {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<Results> getTasks() async {
    try {
      final db = await SQLHelper.instance.database;
      final response = await db?.query(SQLHelper.tableName, orderBy: 'Id');
      final result = response!.map((e) => TaskModel.fromJson(e)).toList();
      return Success(value: result);
    } catch (e) {
      return Failed(value: e);
    }
  }

  @override
  Future<Results> updateTask() {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
