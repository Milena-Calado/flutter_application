import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/register.dart';
import 'package:flutter_application/src/modules/presenter/pages/tasks_tela.dart';

import 'user.dart';

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
    if (username == '' && password == '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TaskListPage(),
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
        builder: (context) => const RegistrationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmacia HC'),
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
            Container(
              constraints: const BoxConstraints(
                  maxWidth: 400), // Defina a largura máxima desejada
              child: TextFormField(
                controller: _usernameController,
                style: const TextStyle(
                    fontSize: 18), // Defina o tamanho da fonte desejado
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20), // Ajuste o espaçamento interno
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                  maxWidth: 400), // Defina a largura máxima desejada
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                    fontSize: 18), // Defina o tamanho da fonte desejado

                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20), // Ajuste o espaçamento interno
                ),
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
