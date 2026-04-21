import 'package:flutter/material.dart';

class TelaPerfilJogador extends StatefulWidget {
  final String nome;
  final String email;

  const TelaPerfilJogador({super.key, required this.nome, required this.email});

  @override
  State<TelaPerfilJogador> createState() => _TelaPerfilJogadorState();
}

class _TelaPerfilJogadorState extends State<TelaPerfilJogador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil do jogador')),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Text(
                  'Nome: ${widget.nome}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 40),
              children: [_campos(Icons.grid_view, 'Minhas reservas', () {})],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _campos(IconData icone, String titulo, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icone, color: Colors.white),
    title: Text(titulo, style: TextStyle(color: Colors.white)),
    onTap: onTap,
  );
}
