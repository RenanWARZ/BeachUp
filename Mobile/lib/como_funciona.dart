import 'package:flutter/material.dart';

class ComoFunciona extends StatefulWidget {
  const ComoFunciona({super.key});

  @override
  State<ComoFunciona> createState() => _ComoFuncionaState();
}

class _ComoFuncionaState extends State<ComoFunciona> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      color: Colors.white,
      child: Center(
        child: Text(
          'Como funciona',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}