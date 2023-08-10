import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/tasks_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskListPage(),
    );
  }
}
class TaskRegisterPage extends StatefulWidget {
  const TaskRegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskRegisterPageState createState() => _TaskRegisterPageState();
}

class _TaskRegisterPageState extends State<TaskRegisterPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Register')),
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
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _timeController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _statusController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskListPage(),
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