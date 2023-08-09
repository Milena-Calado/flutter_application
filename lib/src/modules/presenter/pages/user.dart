import 'package:flutter/material.dart';
import 'package:flutter_application/src/modules/presenter/pages/tasks_tela.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, $username'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskListPage(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/construcao.png', // Caminho da imagem
              width: 300, // Largura da imagem
              height: 300, // Altura da imagem
            ),
          ],
        ),
      ),
    );
  }
}
