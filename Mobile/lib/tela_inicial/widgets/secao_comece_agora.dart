import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial/start_screen.dart';

class SecaoComeceAgora extends StatefulWidget {
  const SecaoComeceAgora({super.key});

  @override
  State<SecaoComeceAgora> createState() => _SecaoComeceAgoraState();
}

class _SecaoComeceAgoraState extends State<SecaoComeceAgora> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 37, 36, 36)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          nomeSecao('Comece agora'),
          Text(
            'Pronto para elevar o \n nível da sua gestão \n esportiva',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          SizedBox(height: 20),
          Text(
            'Leve mais organização, visibilidade e\n profissionalismo para sua quadra, torneio\n ou comindade de Beach Tennis',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text('Criar conta', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: Text('Saiba mais', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
