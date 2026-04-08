
import 'package:flutter/material.dart';

class SecaoRodape extends StatelessWidget {
  const SecaoRodape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0D0D0D),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'asset/logo1.png',
                          height: 35,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'BeachUp',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Gestão inteligente para quadras,\ncampeonatos e jogadores.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 30),

              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Navegação',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    _itemNav(context, Icons.home, 'Home', () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    }),

                    _itemNav(context, Icons.info, 'Sobre', () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Ir para Sobre')),
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(width: 30),

              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contato',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    _itemNav(context, Icons.camera_alt, 'Instagram', () {
                      _mensagem(context, 'Abrir Instagram');
                    }),

                    _itemNav(context, Icons.chat, 'WhatsApp', () {
                      _mensagem(context, 'Abrir WhatsApp');
                    }),

                    _itemNav(context, Icons.facebook, 'Facebook', () {
                      _mensagem(context, 'Abrir Facebook');
                    }),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 30),
          Divider(color: Colors.white24),
          SizedBox(height: 10),

          Text(
            '© 2026 BeachUp — Todos os direitos reservados.',
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _itemNav(
    BuildContext context,
    IconData icon,
    String texto,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.orange, size: 18),
            SizedBox(width: 8),
            Text(
              texto,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  void _mensagem(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }
}