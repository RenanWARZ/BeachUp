import 'package:flutter/material.dart';

class SecaoComoFunciona extends StatefulWidget {
  const SecaoComoFunciona({super.key});

  @override
  State<SecaoComoFunciona> createState() => _ComoFuncionaState();
}

class _ComoFuncionaState extends State<SecaoComoFunciona> {
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
            child: Text("Como funciona"),
          ),
          SizedBox(height: 35), //ESPAÇAMENTO ENTRE O BOTÃO E O TEXTO
          //Texto
          const Text(
            'Comece em poucos passos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 20), //ESPAÇAMENTO ENTRE O TÍTULO E O SUBTÍTULO

          const Text(
            '\nUma experiência simples para quem quer organizar, participar e crescer no Beach Tennis.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),

          SizedBox(height: 60), //ESPAÇAMENTO ENTRE O TEXTO E OS CARDS
          //####################CARD 1######################################################);
          _card(
            numero: '#01',
            titulo: 'titulo',
            descricao:
                'Crie e administre torneios com categorias, confrontos, resultados e organização profissional.',
          ),
          //ESPAÇAMENTO ENTRE OS CARDS
          SizedBox(height: 20),
          //xxxxxxxxxxxxxxxxxxxxxxx
          //###################CARD 2###########################################################
          _card(
            numero: '#02',
            titulo: 'Gerencie sua operação',
            descricao:
                'Centralize jogadores, partidas, torneios, reservas e informações em um só lugar.',
          ),
          //ESPAÇAMENTO ENTRE OS CARDS
          SizedBox(height: 20),
          //####################CARD 3###################################
          _card(
            numero: "#03",
            titulo: 'Ganhe visibilidade',
            descricao:
                'Fortaleça sua presença no esporte e entregue uma experiência mais profissional para todos.',
          ),
        ],
      ),
    );
  }
}

Widget _card({
  required String numero,
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
        BoxShadow(color: Colors.orange, blurRadius: 10, offset: Offset(0, 10)),
      ],
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(),
          child: Text(
            numero,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //Espaçamento
        SizedBox(height: 10),
        //Título
        Text(
          titulo,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Espaçamento
        SizedBox(height: 20),
        Text(descricao, style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    ),
  );
}
