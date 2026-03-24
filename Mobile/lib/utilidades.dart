import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';

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
          child: const Text("Login"),
        ),
      ),
    ],
  );
}

void navigatorPush(BuildContext context, Widget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}
