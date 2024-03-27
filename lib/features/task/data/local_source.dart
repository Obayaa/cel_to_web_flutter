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
  Future<Results> deleteTask(int id) async {
    try {
      final db = await SQLHelper.instance.database;
      final response =
          await db?.delete(SQLHelper.tableName, where: "id=?", whereArgs: [id]);
      //  return response.map((e) => TaskModel.fromJson(e)).toList();
      log("deleted response: $response");
      return Success(value: response);
    } catch (e) {
      return Failed(value: e);
    }
  }

  @override
  Future<Results> getTask(int id) async {
    try {
      final db = await SQLHelper.instance.database;
      final response = await db?.query(SQLHelper.tableName,
          where: "id=?", whereArgs: ['id'], limit: 1);
      final result = response!.map((e) => TaskModel.fromJson(e)).toList();
      return Success(value: result);
    } catch (e) {
      return Failed(value: e);
    }
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
  Future<Results> updateTask(String title, String description, int id) async {
    try {
      final db = await SQLHelper.instance.database;
      Map<String, String> values = {
        "title": title,
        "description": description,
      };
      log("values $values");
      final response = await db?.update(
        SQLHelper.tableName,
        values,
        where: "id=?",
        whereArgs: [id],
      );

      log('updated data: $response');
      return Success(value: response);
    } catch (e) {
      log('error: $e');
      return Failed(value: e);
    }
  }
}
