import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro_contratante_screen.dart';
import 'package:flutter_application_1/screens/cadastro_jogador.dart';
import 'package:flutter_application_1/screens/reservar_quadras.dart';
import 'package:flutter_application_1/screens/tela_inicial/start_screen.dart';
import 'package:flutter_application_1/screens/widgets/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _inidiceAtual = 0;

  //Listar páginas pra navegar
  final List<Widget> _paginas = [
    const StartScreen(),
    const ReservarQuadras(),
    const CadastroJogador(),
    const CadastroContratanteScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_inidiceAtual],
      bottomNavigationBar: Navbar(
        currentIndex: _inidiceAtual,
        onTap: (index) {
          setState(() {
            _inidiceAtual = index;
          });
        },
      ),
    );
  }
}
