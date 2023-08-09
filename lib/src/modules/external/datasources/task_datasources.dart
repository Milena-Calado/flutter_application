import 'package:flutter_application/src/modules/infra/datasources/tasks_datasource.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class TasksDatasource implements ITasksDataSource {
  final Dio dio;
  final SharedPreferences _prefs;

  TasksDatasource(this.dio, this._prefs);

  @override
  Future<List> getTasks() async {
    // Verifique se as tarefas já foram salvas no SharedPreferences
    final savedTasks = _prefs.getStringList('tasks');

    if (savedTasks != null) {
      return savedTasks;
    }

    try {
      final response = await dio.get('/tasks');
      final tasks = response.data;

      // Salve as tarefas no SharedPreferences
      await _prefs.setStringList('tasks', tasks.cast<String>());

      return tasks;
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }
}
