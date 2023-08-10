import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmácia HC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Farmacia HC',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//      //routeInformationParser: Modular.routeInformationParser,
//      //routerDelegate: Modular.routerDelegate,
//     );
//   }
// }
}
