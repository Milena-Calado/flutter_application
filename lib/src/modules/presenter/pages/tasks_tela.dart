import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/tasks_register.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class TaskListPage extends StatefulWidget {
  final List<String> tasks;

  const TaskListPage({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedTasks = prefs.getStringList('tasks');
    if (savedTasks != null) {
      setState(() {
        tasks = savedTasks;
      });
    }
  }

  Future<void> _removeTask(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedTasks = prefs.getStringList('tasks') ?? [];
    savedTasks.removeAt(index);
    await prefs.setStringList('tasks', savedTasks);
    _loadTasks(); // Recarrega a lista após remover a task
  }

  void _logout() {
    // Implemente a lógica de logout aqui, se necessário
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _addTask() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const TaskRegisterPage()),
    );
  }

  void _showTaskDetails(String taskName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Task Details'),
          content: Text(taskName), // Exibe os detalhes da tarefa aqui
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha a pop-up
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.task),
            title: Text(widget.tasks[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _removeTask(index);
              },
            ),
            onTap: () {
              _showTaskDetails(widget.tasks[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask, // Chama a função _addTask ao ser pressionado
        child: const Icon(Icons.add),
      ),
    );
  }
}
