import 'package:flutter_application/src/modules/infra/datasources/tasks_datasource.dart';
import 'package:dio/dio.dart';

class TasksDatasource implements ITasksDataSource {
  final Dio dio;
  TasksDatasource(this.dio);

  @override
  Future<List> getTasks() async {
    try {
      final response = await dio.get('/tasks');

      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch tasks: $e');
    }
  }
}
