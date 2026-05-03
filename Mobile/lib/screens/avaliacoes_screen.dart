import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/avaliacao.dart';
import 'package:flutter_application_1/widgets/custom_appbar.dart';

class AvaliacoesScreen extends StatefulWidget {
  const AvaliacoesScreen({super.key});

  @override
  State<AvaliacoesScreen> createState() => _AvaliacoesState();
}

class _AvaliacoesState extends State<AvaliacoesScreen> {
  TextEditingController txtNomeController = TextEditingController();
  TextEditingController txtComentarioController = TextEditingController();

  String nome = "";
  String comentario = "";
  int rating = 0;
  List<Avaliacao> avaliacoes = [];

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
                TextField(
                  controller: txtNomeController,
                  decoration: InputDecoration(
                    labelText: "Seu nome",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Text('Sua nota de 1 a 5 estrelas:'),
                _estrelas(),
                SizedBox(height: 10),

                Text('Comentário'),
                TextField(
                  controller: txtComentarioController,
                  decoration: InputDecoration(
                    labelText: 'Conte como foi sua experiência',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (rating == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Selecione uma nota!')),
                      );
                      return;
                    }
                    if (txtNomeController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Digite seu nome!')),
                      );
                      return;
                    }
                    if (txtComentarioController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Digite um comentário!')),
                      );
                      return;
                    }
                    setState(() {
                      avaliacoes.add(
                        Avaliacao(
                          nome: txtNomeController.text,
                          comentario: txtComentarioController.text,
                          rating: rating,
                        ),
                      );
                      //Limpa os campos após enviar
                      txtNomeController.clear();
                      txtComentarioController.clear();
                      rating = 0;
                    });
                  },
                  child: Text('Enviar avaliação'),
                ),
                SizedBox(height: 15),
                Text('Avaliações', style: TextStyle(fontSize: 18)),

                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: avaliacoes.asMap().entries.map((entry) {
                      int index = entry.key;
                      Avaliacao avaliacao = entry.value;

                      return Card(
                        margin: EdgeInsets.only(top: 10),

                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nome: ${avaliacao.nome}'),
                              _exibirEstrelas(avaliacao.rating),
                              Text('Comentário:\n ${avaliacao.comentario}'),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => _editarAvaliacao(index),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => _excluirAvaliacao(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _estrelas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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

  //método exibir estrelas
  Widget _exibirEstrelas(int rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.orange : Colors.grey,
          size: 20,
        );
      }),
    );
  }

  //Método para editar
  void _editarAvaliacao(int index) {
    Avaliacao avaliacao = avaliacoes[index];

    //Preenche todos os campos com os dados existentes
    txtNomeController.text = avaliacao.nome;
    txtComentarioController.text = avaliacao.comentario;
    setState(() {
      rating = avaliacao.rating;
      avaliacoes.removeAt(index);
    });
  }

  //método para excluir
  void _excluirAvaliacao(int index) {
    setState(() {
      avaliacoes.removeAt(index);
    });
  }
}
