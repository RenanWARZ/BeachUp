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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Perfil do jogador',
                    style: TextStyle(color: Colors.orange, fontSize: 40),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Nome: ${widget.nome}',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'E-mail: ${widget.email}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _campos(
                    Icons.location_on,
                    'Campos',
                    'Ver quadras disponíveis',
                    () {},
                  ),
                  _campos(
                    Icons.emoji_events,
                    'Campeonato',
                    'Inscrições e chaves',
                    () {},
                  ),
                  _campos(
                    Icons.history,
                    'Histórico de partidas',
                    'Resultados recentes',
                    () {},
                  ),
                  _campos(
                    Icons.groups,
                    'Meu time',
                    'Gestão de parceiros',
                    () {},
                  ),
                  _campos(
                    Icons.event_available,
                    'Minhas reservas',
                    'Horários agendados',
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//widget reutilizável para lista
Widget _campos(
  IconData icone,
  String titulo,
  String subtitulo,
  VoidCallback onTap,
) {
  return Card(
    color: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ListTile(
      leading: Icon(icone, color: Colors.white),
      title: Text(titulo, style: TextStyle(color: Colors.white)),
      subtitle: Text(
        subtitulo,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      onTap: onTap,
    ),
  );
}
