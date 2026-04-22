import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro_contratante_screen.dart';
import 'package:flutter_application_1/tela_inicial/widgets/custom_app_bar.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                Image.asset('assets/logo1.png', height: 40),
                const SizedBox(width: 40),

                //TEXTO
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BeachUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Beach Tennis Platform',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),

                //BOTÃO FECHAR
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white24),

          //LISTA
          Expanded(
            child: ListView(
              children: [
                _item(Icons.home, 'Início', () {
                  Navigator.pop(context);
                }),

                _item(Icons.grid_view, "Redirecionamento", () {}),

                _item(Icons.access_time, "Reservar quadras", () {}),

                _item(Icons.star, "Avaliações", () {}),

                _item(Icons.credit_card, "Pagamentos", () {}),

                _item(Icons.add_box, "Cadastre sua quadra", () {}),

                _item(Icons.info, "Sobre-nos", () {}),
              ],
            ),
          ),
          //LINHA LARANJA
          Container(
            height: 1,
            color: Colors.orange,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),

          const SizedBox(height: 20),

          //BOTÃO
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  navigatorPush(context, CadastroContratanteScreen());
                },
                icon: const Icon(Icons.login, color: Colors.white),
                label: const Text("Entrar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
