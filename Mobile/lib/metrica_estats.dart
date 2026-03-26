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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('data'),
      _status(Icons.person, '+350','Jogadores ativos'),
      _status(Icons.sports_tennis, '12 +', 'Quadras parceiras'),
      _status(Icons.calendar_month, '+40', 'Eventos realizados'),
      _status(Icons.stars, '98%', 'Satisfação dos usuários')
    ]);
  }
}

Widget _status(IconData icon, String quant, String texto) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.orange,
        size: 30,

      ),
      //###################quant#####################
      Text(
        quant,
        style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),
      ),
      SizedBox(height: 7,),
      //#################texto############################
        Text(texto,
        style: TextStyle(fontSize: 22, color: Colors.white),),

    ],
  );
}

