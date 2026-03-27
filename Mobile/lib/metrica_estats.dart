import 'package:flutter/material.dart';

class MetricaEstats extends StatefulWidget {
  const MetricaEstats({super.key});

  @override
  State<MetricaEstats> createState() => _MetricaEstatsState();
}

class _MetricaEstatsState extends State<MetricaEstats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: GridView.count(
            crossAxisCount: 2, // Define 2 colunas
            mainAxisSpacing: 15, // Espaço vertical entre as linhas
            crossAxisSpacing: 15, // Espaço horizontal entre as colunas
            physics:
                const NeverScrollableScrollPhysics(), // Impede que a grade role separadamente
            shrinkWrap: true,
            childAspectRatio:
                1.1, //Controla a proporção (largura / altura) dos cartões
            children: [
              _status(Icons.person, '+350', 'Jogadores ativos'),
              _status(Icons.sports_tennis, '12 +', 'Quadras parceiras'),
              _status(Icons.calendar_month, '+40', 'Eventos realizados'),
              _status(
                Icons.workspace_premium_outlined,
                '98%',
                'Satisfação dos usuários',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _status(IconData icon, String quant, String texto) {
  return Column(
    children: [
      Icon(icon, color: Colors.orange, size: 30),
      //###################quant#####################
      Text(
        quant,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 7),
      //#################texto############################
      Text(texto, style: TextStyle(fontSize: 14, color: Colors.white)),
      SizedBox(height: 20),
    ],
  );
}
