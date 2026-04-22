import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro_jogador.dart';

AppBar getAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Row(
      children: [
        Image.asset('assets/logo1.png', height: 35),
        const SizedBox(width: 10),
        Text(title, style: TextStyle(color: Colors.white)),
      ],
    ),
    actions: actions,
  );
}

AppBar getStartScreenAppBar(BuildContext context) {
  return getAppBar(
    "BeachUp",
    actions: [
      Hero(
        tag: "login",
        child: ElevatedButton(
          onPressed: () {
            navigatorPush(context, CadastroJogador());
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          child: const Text("Cadastrar-se"),
        ),
      ),
    ],
  );
}

void navigatorPush(BuildContext context, Widget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}
