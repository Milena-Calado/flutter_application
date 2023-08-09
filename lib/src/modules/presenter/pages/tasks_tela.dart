import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Task List App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const TaskListPage(),
//     );
//   }
// }

class TaskListPage extends StatelessWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Task 1'),
            subtitle: Text('Description for Task 1'),
          ),
          ListTile(
            title: Text('Task 2'),
            subtitle: Text('Description for Task 2'),
          ),
          // Add more ListTiles for other tasks
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TaskRegistrationPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskRegistrationPage extends StatelessWidget {
  const TaskRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Task Page',
            ),
            // Add form fields and registration logic here
          ],
        ),
      ),
    );
  }
}
