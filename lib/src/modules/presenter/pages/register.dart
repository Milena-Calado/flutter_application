import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/home.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

void _registerUser(
    String username, String password, String passwordConfirm) async {
  if (password != passwordConfirm) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Password Error'),
        content: const Text('Passwords do not match. Please try again.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } else {
    // Save username and password
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);

    // Show registration success dialog
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Successful'),
          content: const Text('You have been registered successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ); // Navigate back to LoginPage
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/logo_inicial.png',
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.4,
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
                      horizontal: 18), // Ajuste o espaçamento interno
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
                      horizontal: 18), // Ajuste o espaçamento interno
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                  maxWidth: 400), // Defina a largura máxima desejada
              child: TextFormField(
                controller: _passwordConfirmController,
                obscureText: true,
                style: const TextStyle(
                    fontSize: 18), // Defina o tamanho da fonte desejado
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  // Ajuste o espaçamento interno
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _registerUser(
                _usernameController.text,
                _passwordController.text,
                _passwordConfirmController.text,                
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
