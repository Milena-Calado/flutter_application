import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/tasks_register.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<String> tasks = TaskRegisterPage.tasks; // Obtenha as tasks da classe TaskRegisterPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskRegisterPage(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            // Adicione outras informações relevantes da task aqui
          );
        },
      ),
    );
  }
}
