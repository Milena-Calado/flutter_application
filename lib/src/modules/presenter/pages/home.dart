// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/shared_preference_helper.dart';
import 'tasks_tela.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Buscar dados salvos no SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('username');
    String? savedPassword = prefs.getString('password');

    // Verificação de login
    if (username == savedUsername && password == savedPassword) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TaskListPage(
            tasks: [],
          ),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Error'),
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

  void _register() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  // void _clearData() async {
  //   await SharedPreferencesHelper
  //       .clearTasks(); // Chama o método para limpar os dados
  //   // Recarrega a lista após limpar os dados
  // }

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
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.4,
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
            //  const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: _clearData,
            //   child: const Text('Clean cache'),
            // ),
          ],
        ),
      ),
    );
  }
}
