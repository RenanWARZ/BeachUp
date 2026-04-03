import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial/start_screen.dart';

class SecaoSobre extends StatefulWidget {
  const SecaoSobre({super.key});

  @override
  State<SecaoSobre> createState() => _SobreBeachUpState();
}

class _SobreBeachUpState extends State<SecaoSobre> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          //Botão
          nomeSecao('Sobre o Beach Up'),
          SizedBox(height: 10),
          //Image.asset('assets/'),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Tecnologia pensada para impulsionar o esporte',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          SizedBox(height: 19), //ESPAÇAMENTO ENTRE O TÍTULO E O SUBTÍTULO

          const Text(
            'O BeachUp nasce para integrar atletas, quadras e organizadores em uma plataforma \n moderna, intuitiva e escalável, criada para evoluir junto com a comunidade. Mais do \n que conectar pessoas, buscamos estruturar e simplificar toda a jornada do esporte, desde a \n organização de jogos até a gestão completa de eventos e espaços. Nosso propósito é \n elevar a gestão esportiva a um novo padrão — mais eficiente, profissional e alinhado à \n dinâmica real do Beach Tennis. Com soluções inteligentes e foco na experiência do usuário, \n a BeachUp transforma desafios operacionais em processos simples, promovendo mais \n conexão, organização e crescimento para todo o ecossistema esportivo.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white70),
          ),
          SizedBox(height: 20),

          //####################ÍCONES##########################################
          _icones(
            Icons.workspace_premium_outlined,
            'Missão',
            'Tornar o esporte mais acessível, organizado e conectado, usando tecnologia para aproximar pessoas e criar experiências reais dentro das quadras.',
          ),
          //###########Linha para dividir#######################################
          Divider(color: Colors.grey),
          _icones(
            Icons.visibility,
            'Visão',
            'Ser a principal plataforma digital do Beach Tennis no Brasil, impulsionando o crescimento do esporte e fortalecendo toda a comunidade ao redor dele.',
          ),
          //###########Linha para dividir#######################################
          Divider(color: Colors.grey),
          _icones(
            Icons.star,
            'Diferencial ',
            'O BeachUp une design moderno, navegação intuitiva e soluções práticas para organizar jogos,conectar pessoas e facilitar o dia a dia dentro e fora das quadras.',
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}

Widget _icones(IconData icon, String titulo, String descricao) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              Icons.workspace_premium_outlined,
              color: Colors.orange,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(titulo, style: TextStyle(fontSize: 22, color: Colors.white)),
          ],
        ),
        SizedBox(height: 10),
        Text(descricao, style: TextStyle(fontSize: 15, color: Colors.white)),
      ],
    ),
  );
}
