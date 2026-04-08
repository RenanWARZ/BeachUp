import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_cadastro/login_screen.dart';

AppBar getAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text(title),
    actions: actions,
  );
}

AppBar getStartScreenAppBar(BuildContext context) {
  return getAppBar(
    
    "Beach Tennis",
    actions: [
      Hero(
        tag: "login",
        child: ElevatedButton(
          onPressed: () {
            navigatorPush(context, LoginScreen());
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


Widget getTextField({String? labelText, TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: labelText,
      ),
    ),
  );
}
