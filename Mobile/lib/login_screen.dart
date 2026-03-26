import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilidades.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtNomeController = TextEditingController();
  TextEditingController txtSobrenomeController = TextEditingController();
  TextEditingController txtIdadeController = TextEditingController();

  String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: Center(child: Text('Beach Up')),
      ),
      body: Column(
        children: [
          getTextField(labelText: "nome", controller: txtNomeController),
          getTextField(labelText: "sobrenome", controller: txtNomeController),
          getTextField(labelText: "idade", controller: txtNomeController),

          SizedBox(
            //caixa redimensionável
            width: double.infinity,
            child: FloatingActionButton(
              child: Text('Cadastrar'),
              onPressed: () {
                String nome = txtNomeController.text;
                String sobrenome = txtSobrenomeController.text;
                String idade = txtIdadeController.text;

                setState(() {
                  resultado =
                      "Nome: $nome, Sobrenome: $sobrenome, idade: $idade"; //variável com $ é interpolação
                });  
              },
            ),
          ),

          Text(resultado),
        ],
      ),
    );
  }
}
