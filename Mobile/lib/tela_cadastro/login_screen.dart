import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial/widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController txtNomeController = TextEditingController();
  TextEditingController txtTelefoneController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtSenhaController = TextEditingController();
  TextEditingController txtConfirmarSenhaController = TextEditingController();

  String resultado = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(

     appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 5, 5),
        foregroundColor: Colors.white,
        centerTitle: true,

        title: Row(
          
          children: [
            Image.asset(
              'asset/logo.png', 
              height: 35,
            ),
            SizedBox(width: 8),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Beach ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'Up',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [

           
            Text(
              
              'Criar uma conta gratuita',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          

Row(//deixa a escrita entrar clicavel e redireciona para tela de login
            children: [
              Text('Já tem conta? '),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Entrar' ,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),         

          SizedBox(height: 35), //ESPAÇAMENTO ENTRE O TEXTO 1 E O  TEXTO 2
          //Texto
Center(
  
            child: Text(
              'Cadastro de usuário',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
                     
          Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              getTextField(labelText: "Nome:", controller: txtNomeController),
              getTextField(
                labelText: "Telefone:",
                controller: txtTelefoneController,
              ),
              getTextField(
                labelText: "E-mail:",
                controller: txtEmailController,
              ),
              getTextField(labelText: "Senha:", controller: txtSenhaController),
              getTextField(
                labelText: "Confirmar senha:",
                controller: txtConfirmarSenhaController,
              ),
            ],
          ),

SizedBox(height: 10),

          Text(style: TextStyle(fontSize: 12),'Termos de uso e política de privacidade'),

SizedBox(height: 10),

Center(
           child: SizedBox(  //caixa redimensionável do botão
            width:200,
            child: FloatingActionButton(
              backgroundColor: Color(0xFFFFA500), 
              child: Text('Criar minha conta'),


              onPressed: () {
                String nome = txtNomeController.text;
                String telefone = txtTelefoneController.text;
                String email = txtEmailController.text;
                String senha = txtSenhaController.text;


                setState(() {
                  resultado =
                      "Nome: $nome, Telefone: $telefone, E-mail: $email, Senha: $senha"; //variável com $ é interpolação
                });  
              },
            ),
          ),
        ),

           SizedBox(height: 20),
          Text(resultado),
        ],
      ),
    );
  }
}
