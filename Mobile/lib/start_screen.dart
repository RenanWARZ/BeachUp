import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilidades.dart';
import 'package:flutter_application_1/drawer.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getStartScreenAppBar(context),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
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
            //PARTE2########################################
            Container(
              color: Colors.black,
              height: 400,
              child: Center(
                child: Text(
                  'teste',
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ),
            ),
            //PARTE3########################################
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                //CARD 1
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 37, 36, 36),
                    borderRadius: BorderRadius.circular(15),
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
                        child: Icon(Icons.favorite, color: Colors.white),
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
                      SizedBox(height: 10),
                      Text(
                        "Crie e administre torneios com categorias, confrontos, resultados e organização profissional.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                //ESPAÇAMENTO ENTRE OS CARDS
                SizedBox(height: 20),
                //CARD 2###########################################################
                Container(
                  width: 250,
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 30, 30),
                    borderRadius: BorderRadius.circular(15),
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
                        child: Icon(Icons.favorite, color: Colors.white),
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
                SizedBox(width: 20),
                //CARD 3###########################################################
                Container(
                  width: 250,
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 30, 30),
                    borderRadius: BorderRadius.circular(15),
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
                        child: Icon(Icons.favorite, color: Colors.white),
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
                SizedBox(width: 20),
                //CARD 4###########################################################
                Container(
                  width: 250,
                  padding: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 30, 30),
                    borderRadius: BorderRadius.circular(15),
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
                        child: Icon(Icons.favorite, color: Colors.white),
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
            //Terceira parte########################################
            Container(
              color: Colors.white,
              height: 400,
              child: const Center(
                child: Text(
                  "Beach Tennis é um esporte de raquete jogado na areia, semelhante ao tênis tradicional...",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            //Tentar ver se é possível criar uma classe pra cards
            //Fazer um rodapé
          ],
        ),
      ),
    );
  }
}
