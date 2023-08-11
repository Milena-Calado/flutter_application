import 'package:flutter_application/src/modules/domain/entities/tasks.dart';

class TasksAdapter {
  static Tasks fromJson(Map json) => Tasks(
        description: json['description'],
        date: json['date'],
        status: json['status'],
        name: '',
      );
}
