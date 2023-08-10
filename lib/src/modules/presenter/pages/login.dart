import 'package:flutter/material.dart';

import '../../domain/usecases/get_user.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmacia HC',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const LoginPage(), // Alterando para a página de login
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Farmácia HC')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: UserRepository.onPressedLogin(
                _usernameController.text,
                _passwordController.text,
              ),
              child: const Text('Login'),
            ),
             const SizedBox(height: 16),
            ElevatedButton(
              onPressed: UserRepository.onPressedRegister(
                _usernameController.text,
                _passwordController.text,
                _passwordController.text,
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

