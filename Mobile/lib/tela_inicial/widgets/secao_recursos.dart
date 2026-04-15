import 'package:flutter/material.dart';

class SecaoRecursos extends StatefulWidget {
  const SecaoRecursos({super.key});

  @override
  State<SecaoRecursos> createState() => _SecaoRecursosState();
}

class _SecaoRecursosState extends State<SecaoRecursos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      color: const Color(0xFF0D0D0D),
      child: Column(
        children: [
          //Botão
          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.all(20),
            ),
            child: Text("Recursos"),
          ),
          SizedBox(height: 35), //ESPAÇAMENTO ENTRE O BOTÃO E O TEXTO
          //Texto
          const Text(
            'Uma plataforma completa para \n o universo do Beach Tennis',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 20), //ESPAÇAMENTO ENTRE O TÍTULO E O SUBTÍTULO

          const Text(
            '\nOrganize campeonatos, gerencie quadras, acompanhe rankings e conecte jogadores em um único\n ecossistema digital.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),

          SizedBox(height: 60), //ESPAÇAMENTO ENTRE O TEXTO E OS CARDS
          //#######################CARD 1#################################
          _cardRecurso(
            icone: Icons.emoji_events,
            titulo: 'Campeoanto',
            descricao:
                'Crie e administre torneios com categorias, confrontos, resultados e organização profissional.',
          ),
          SizedBox(height: 20),
          //######################CARD 2#################################
          _cardRecurso(
            icone: Icons.bar_chart,
            titulo: "Rankings",
            descricao:
                "Acompanhe evolução, desempenho e posição dos atletas com atualização clara e moderna.",
          ),

          SizedBox(height: 20),
          //#################CARD 3######################################
          _cardRecurso(
            icone: Icons.calendar_month,
            titulo: "Reservas",
            descricao:
                "Gerencie horários, disponibilidade e ocupação das quadras de forma simples e eficiente.",
          ),

          SizedBox(height: 20),
          //###################CARD 4#####################################
          _cardRecurso(
            icone: Icons.groups,
            titulo: "Jogadores",
            descricao:
                "Conecte atletas, organize equipes e fortaleça a comunidade.",
          ),
        ],
      ),
    );
  }
}

Widget _cardRecurso({
  required IconData icone,
  required String titulo,
  required String descricao,
}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 37, 36, 36),
      border: Border.all(color: Colors.orange),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.orange, blurRadius: 20, offset: Offset(0, 10)),
      ],
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Ícone
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icone, color: Colors.white),
        ),
        //Espaçamento
        SizedBox(height: 15),
        //Título
        Text(
          titulo,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Espaçamento
        SizedBox(height: 10),
        //Descricao
        Text(descricao, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    ),
  );
}
