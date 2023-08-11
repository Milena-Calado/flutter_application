import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/tasks_tela.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class TaskRegisterPage extends StatefulWidget {
  static List<String> tasks = [];

  const TaskRegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaskRegisterPageState createState() => _TaskRegisterPageState();

}

class _TaskRegisterPageState extends State<TaskRegisterPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskListPage(tasks: [],),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                icon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
                icon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _statusController,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
                icon: Icon(Icons.stairs),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final task = {
                  'name': _nameController.text,
                  'description': _descriptionController.text,
                  'date': _dateController.text,
                  'status': _statusController.text,
                };
                SharedPreferences prefs = await SharedPreferences.getInstance();
                List<String> savedTasks = prefs.getStringList('tasks') ?? [];
                savedTasks.add(task.toString());
                await prefs.setStringList('tasks', savedTasks);

                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskListPage(tasks: savedTasks),
                  ),
                );
              },
              child: const Text('Task Register'),
            ),
          ],
        ),
      ),
    );
  }
}
