import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial/start_screen.dart';
//import 'package:flutter_application_1/cadastro_contratante/cadastro_contratante_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: StartScreen());
  }
}
