import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilidades.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_application_1/como_funciona.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getStartScreenAppBar(context),
      drawer: MenuDrawer(),
      body: ListView(
        children: [
          //PARTE1########################################
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Beach Tennis",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          //RECURSOS########################################
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
            color: const Color(0xFF0D0D0D),
            child: Column(
              children: [
                //Botão
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.all(20),
                  ),
                  child: Text("Recursos"),
                ),
                //Texto
                Text.rich(
                  TextSpan(
                    text:
                        'Uma plataforma completa para o universo do Beach Tennis',
                    style: TextStyle(fontSize: 30, color: Colors.orange),

                    children: [
                      TextSpan(
                        text:
                            '\nOrganize campeonatos, gerencie quadras, acompanhe rankings e conecte jogadores em um único ecossistema digital.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                //CARD 1######################################################
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 36, 36),
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //5. Ícone com fundo laranja
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.emoji_events, color: Colors.white),
                      ),
                      //Espaçamento
                      SizedBox(height: 15),
                      //Título
                      Text(
                        "Campeonato\n",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //Espaçamento
                      SizedBox(height: 2),
                      Text(
                        "Crie e administre torneios com categorias, confrontos, resultados e organização profissional.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                //ESPAÇAMENTO ENTRE OS CARDS
                SizedBox(height: 20),
                //xxxxxxxxxxxxxxxxxxxxxxx
                //CARD 2###########################################################
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 36, 36),
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Ícone com fundo laranja
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.bar_chart, color: Colors.white),
                      ),
                      //Espaçamento
                      SizedBox(height: 15),
                      //Título
                      Text(
                        "Rankings\n",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //Espaçamento
                      SizedBox(height: 10),
                      Text(
                        "Acompanhe evolução, desempenho e posição dos atletas com atualização clara e moderna.",

                        //softWrap: true,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                //ESPAÇAMENTO ENTRE OS CARDS
                SizedBox(height: 20),
                //xxxxxxxxxxxxxxxxxxxxxxxx
                //CARD 3###########################################################
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 36, 36),
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //5. Ícone com fundo laranja
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.calendar_month, color: Colors.white),
                      ),
                      //Espaçamento
                      SizedBox(height: 15),
                      //Título
                      Text(
                        "Reservas\n",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //Espaçamento
                      SizedBox(height: 10),
                      Text(
                        "Gerencie horários, disponibilidade e ocupação das quadras de forma simples e eficiente.",

                        //softWrap: true,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                //ESPAÇAMENTO ENTRE OS CARDS
                SizedBox(height: 20),
                //xxxxxxxxxxxxxxxxxxxxxxx
                //CARD 4###########################################################
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 36, 36),
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //5. Ícone com fundo laranja
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.groups, color: Colors.white),
                      ),
                      //Espaçamento
                      SizedBox(height: 15),
                      //Título
                      Text(
                        "Reservas\n",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //Espaçamento
                      SizedBox(height: 10),
                      Text(
                        "Gerencie horários, disponibilidade e ocupação das quadras de forma simples e eficiente.",

                        //softWrap: true,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Terceira parte########################################
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 40),
            child: const Center(
              child: Text(
                "Beach Tennis é um esporte de raquete jogado na areia, semelhante ao tênis tradicional...",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          //Parte 4########################################
          //Conectar com o arquivo como_funciona.dart
          ComoFunciona(),
        ],
      ),
    );
  }
}
