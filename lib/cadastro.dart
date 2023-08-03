
import 'package:flutter/material.dart';

import 'login.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordconfirmController = TextEditingController();

  void _cadastro() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String passwordconfirm = _passwordconfirmController.text;

    // verificação de login
    if (username == 'admin' && password == 'admin' && passwordconfirm == 'admin') {
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
          title: const Text('Register error'),
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
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
            TextFormField(
              controller: _passwordconfirmController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Confirm',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _cadastro,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}