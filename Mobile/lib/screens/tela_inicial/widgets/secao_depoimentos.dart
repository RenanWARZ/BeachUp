import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/tela_inicial/start_screen.dart';

class SecaoDepoimentos extends StatefulWidget {
  const SecaoDepoimentos({super.key});

  @override
  State<SecaoDepoimentos> createState() => _SecaoDepoimentosState();
}

class _SecaoDepoimentosState extends State<SecaoDepoimentos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        nomeSecao('Depoimentos'),
        tituloSubtitulo(
          'Quem usa, recomenda',
          'Resultados reais para quem vive o Beach Tennis no dia a dia.',
        ),
        _cardDepoimento(
          '“A BeachUp trouxe mais organização para os campeonatos do nosso clube. Hoje temos muito mais controle e agilidade.”',
          5,
          'Renan Pilan',
          'Gestor de quadras',
        ),
        _cardDepoimento(
          '“A gestão das quadras ficou muito mais profissional. Tudo ficou mais claro para jogadores e administradores.”',
          4,
          'Fernanda Alves ',
          'Gestora de quadras',
        ),
        _cardDepoimento(
          '“O ranking, os jogos e as reservas ficaram muito mais acessíveis. É uma plataforma com cara do esporte.”',
          5,
          'Rafael Souza',
          'Jogador',
        ),
      ],
    );
  }
}

Widget _cardDepoimento(
  String texto,
  int estrelas,
  String nome,
  String responsavel,
) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(texto, style: TextStyle(color: Colors.white)),
        SizedBox(height: 10),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: index < estrelas ? Colors.orange : Colors.grey,
              size: 24,
            );
          }),
        ),
        SizedBox(height: 10),
        Text(nome, style: TextStyle(color: Colors.white)),
        SizedBox(height: 7),
        Text(responsavel, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
