import 'package:flutter_application/src/modules/domain/entities/tasks.dart';

class TasksAdapter {
  static Tasks fromJson(Map json) => Tasks(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        time: json['time'],
        status: json['status'],
        name: '',
      );
}
