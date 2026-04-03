import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial/widgets/secao_planos.dart';
import 'package:flutter_application_1/tela_inicial/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/tela_inicial/widgets/custom_drawer.dart';
import 'package:flutter_application_1/tela_inicial/widgets/secao_como_funciona.dart';
import 'package:flutter_application_1/tela_inicial/widgets/secao_recursos.dart';
import 'package:flutter_application_1/tela_inicial/widgets/secao_sobre.dart';
import 'package:flutter_application_1/tela_inicial/widgets/secao_metrica.dart';

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
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    "Sua paixão por\nBeach Tennis\nComeça Aqui",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Organize campeonatos, acompanhe rankings\n e conecte jogadores em um só lugar.",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('Começar agora')),
              ],
            ),
          ),

          SecaoRecursos(),
          SecaoComoFunciona(),
          SecaoSobre(),
          SecaoMetrica(),
          SecaoPlanos(),
        ],
      ),
    );
  }
}

Widget nomeSecao(String nomeSecao) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 41, 21),
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          nomeSecao,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),

      SizedBox(height: 20),
    ],
  );
}

Widget tituloSubtitulo(String titulo, String subtitulo) {
  return Column(
    children: [
      //Texto
      Text(
        titulo,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
      SizedBox(height: 4), //ESPAÇAMENTO ENTRE O TÍTULO E O SUBTÍTULO

      Text(
        subtitulo,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.white70),
      ),
      SizedBox(height: 15),
    ],
  );
}
