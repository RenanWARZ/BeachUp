import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro_jogador.dart';
import 'package:flutter_application_1/screens/widgets/custom_appbar.dart';

class Avaliacoes extends StatefulWidget {
  const Avaliacoes({super.key});

  @override
  State<Avaliacoes> createState() => _AvaliacoesState();
}

class _AvaliacoesState extends State<Avaliacoes> {
  TextEditingController txtNomeController = TextEditingController();
  TextEditingController txtComentarioController = TextEditingController();

  String nome = "";
  String comentario = "";
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.orange,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Faça sua avaliação', style: TextStyle(fontSize: 20)),
                Text(
                  'Sua opinião ajuda outros jogadores a escolherem a melhor quadra.',
                ),
                SizedBox(height: 10),
                //Nome
                getTextField(
                  labelText: "Seu nome",
                  controller: txtNomeController,
                ),
                SizedBox(height: 10),
                _estrelas(),
                SizedBox(height: 10),
                Text('Nota: $rating estrelas'),
                Text('Comentário'),
                getTextField(
                  labelText: "Conte como foi sua experiência",
                  controller: txtComentarioController,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      nome = txtNomeController.text;
                      comentario = txtComentarioController.text;
                    });
                  },
                  child: Text('Enviar avaliação'),
                ),
                SizedBox(height: 20),
                Text('Avaliações', style: TextStyle(fontSize: 18)),
                SizedBox(height: 14),
                Text('Nome: $nome'),
                Text('Comentário: $comentario'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _estrelas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza as estrelas
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              rating = index + 1; // define quantidade de estrelas
            });
          },
          child: Icon(
            Icons.star,
            color: index < rating ? Colors.orange : Colors.grey,
            size: 30,
          ),
        );
      }),
    );
  }
}
