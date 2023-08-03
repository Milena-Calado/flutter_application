import 'package:flutter/material.dart';

import 'cadastro.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmacia HC',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginPage(), // Alterando para a página de login
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // verificação de login
    if (username == 'admin' && password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: username),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('login error'),
          content: const Text('Invalid credentials. Try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CadastroPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: ClipPath(
                child: Image.asset(
                  'assets/logo_inicial.png',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
