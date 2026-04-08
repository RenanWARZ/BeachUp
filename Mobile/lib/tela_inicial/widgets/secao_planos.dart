import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial/start_screen.dart';

class SecaoPlanos extends StatefulWidget {
  const SecaoPlanos({super.key});

  @override
  State<SecaoPlanos> createState() => _PlanosPrecosState();
}

class _PlanosPrecosState extends State<SecaoPlanos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        nomeSecao('Planos'),
        tituloSubtitulo(
          'Escolha o plano ideal para seu espaço \n esportivo ',
          'Do ínicio da divulgação até a gestão completa \nde reservas, visibilidade e eventos.',
        ),
        planoCard(
          titulo: 'Basic',
          valor: 'R\$ 0',
          mes: '/mês',
          textoBotao: 'Começar grátis',
          infos: [
            'Cadastro simples de quadras',
            'Uploads limitados de imagens',
            'Baixa visibilidade no app',
            'Uso para jogos casuais',
            'Horários limitados',
          ],
        ),

        planoCard(
          titulo: 'Gold',
          valor: 'R\$ 199,90',
          mes: '/mês',
          textoBotao: 'Ser Gold',
          destaque: true,
          borderColor: Colors.orange,
          infos: [
            'Cadastro completo de quadras',
            'Uploads ilimitados',
            'Maior destaque no app',
            'Disponível para torneios',
            'Todos os horários liberados',
            'Espaço para divulgar serviços',
          ],
        ),
      ],
    );
  }
}

Widget planoCard({
  required String titulo,
  required String valor,
  required String mes,
  required List<String> infos,
  required String textoBotao,
  Color backgroundColor = const Color(0xFF121212),
  Color borderColor = Colors.transparent,
  Color textColor = Colors.white,
  bool destaque = false,
}) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 22,
                color: destaque ? Colors.yellow : Colors.grey,
              ),
            ),

            SizedBox(height: 10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  valor,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(width: 5),
                Text(mes, style: TextStyle(fontSize: 16, color: textColor)),
              ],
            ),

            SizedBox(height: 20),

            ...infos.map((info) => itemInfo(info, textColor: textColor)),

            SizedBox(height: 20),

            // BOTÃO
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: destaque ? Colors.orange : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: destaque ? null : Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Text(
                textoBotao,
                style: TextStyle(
                  color: destaque ? Colors.white : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      //  FAIXA DIAGONAL (Gold)
      if (destaque)
        Positioned(
          child: Container(decoration: BoxDecoration(color: Colors.orange)),
        ),
    ],
  );
}

Widget itemInfo(String texto, {Color textColor = Colors.white}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(texto, style: TextStyle(color: textColor)),
      ),

      SizedBox(height: 10),
      Divider(height: 10),
      SizedBox(height: 10),
    ],
  );
}
