import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Register'),
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



      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Align(
      //         alignment: Alignment.topCenter,
      //         child: ClipPath(
      //           child: Image.asset(
      //             'assets/logo_inicial.png',
      //             width: MediaQuery.of(context).size.width * 0.9,
      //             height: MediaQuery.of(context).size.height * 0.5,
      //           ),
      //         ),
      //       ),        

//             TextFormField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: 'Username',
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 24),
//             TextFormField(
//               controller: _passwordconfirmController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password Confirm',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _cadastro,
//               child: const Text('Cadastrar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }