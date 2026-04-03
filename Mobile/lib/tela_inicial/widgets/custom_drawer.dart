import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_login/login_screen.dart';
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
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Text(
              'Beach Up\n Beach Tennis Plataform',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () {
              Navigator.pop(context); //fecha menu
            },
          ),

          ListTile(
            leading: Icon(Icons.info),
            title: Text('Recursos'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.air),
            title: Text('Como funicona'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.abc),
            title: Text('Planos'),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.local_activity),
            title: Text('Localização'),
          ),

          SizedBox(height: 210),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              onPressed: () {
                navigatorPush(context, LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
