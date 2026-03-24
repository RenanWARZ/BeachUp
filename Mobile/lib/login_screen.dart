import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Expanded(child: 
      Container(
        width: double.infinity,
        color: Colors.amber,
        child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              
              color: Color.fromARGB(255, 9, 32, 240),
            
          
          )
      )
      
      ),
      )
    );
  }
}
