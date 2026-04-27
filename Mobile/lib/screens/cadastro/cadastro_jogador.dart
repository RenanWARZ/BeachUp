import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/perfil/perfil_jogador.dart';
import 'package:flutter_application_1/widgets/custom_appbar.dart';

class CadastroJogador extends StatefulWidget {
  const CadastroJogador({super.key});

  @override
  State<CadastroJogador> createState() => _LoginScreenState();
}

//Controllers para Captura do texto
class _LoginScreenState extends State<CadastroJogador> {
  TextEditingController txtNomeController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtSenhaController = TextEditingController();
  TextEditingController txtConfSenhaController = TextEditingController();

  //Liberar memória
  @override
  void dispose() {
    txtNomeController.dispose();
    txtEmailController.dispose();
    txtSenhaController.dispose();
    txtConfSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),

              //Logo
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Beach',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    TextSpan(
                      text: 'Up',
                      style: TextStyle(color: Colors.orange, fontSize: 28),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Criar conta',
                style: TextStyle(color: Colors.orange, fontSize: 32),
              ),
              getTextField(
                labelText: "Nome completo",
                controller: txtNomeController,
              ),
              getTextField(labelText: "E-mail", controller: txtEmailController),
              getTextField(labelText: "Senha", controller: txtSenhaController),
              getTextField(
                labelText: "Confirmar Senha",
                controller: txtConfSenhaController,
              ),
              SizedBox(height: 20),
              //Botão cadastrar
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                  ),
                  onPressed: () {
                    String nome = txtNomeController.text;
                    String email = txtEmailController.text;

                    if (nome.isEmpty || email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Preencha todos os campos')),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TelaPerfilJogador(nome: nome, email: email),
                      ),
                    );
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text('ou', style: TextStyle(color: Colors.grey)),
              ),
              SizedBox(height: 20),
              //Botão cadastrar com Google
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,

                  minimumSize: Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                onPressed: () {},
                icon: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/300/300221.png',
                  height: 20,
                ),
                label: Text('Cadastrar com Google'),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Já tem conta?', style: TextStyle(color: Colors.white)),
                  Text('Entrar', style: TextStyle(color: Colors.orange)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Widget reutilizável de campo de texto
Widget getTextField({
  String? labelText,
  TextEditingController? controller,
  TextInputType? keyboardType,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: labelText,
      ),
    ),
  );
}
