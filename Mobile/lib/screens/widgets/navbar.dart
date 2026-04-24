import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const Navbar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      backgroundColor: Color(0xFF0D0D0D),
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,

      items: [
        //1. Tela Inicial
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //2. QUADRAS
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          activeIcon: Icon(Icons.location_on),
          label: 'Quadras',
        ),

        //3. CAMPEONATOS
        /*BottomNavigationBarItem(
          icon: Badge(
            label: Text(
              '2',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            child: Icon(Icons.location_on_outlined),
          ),
          activeIcon: Icon(Icons.emoji_events),
          label: 'Campeoantos',
        ),
        */
        //4. PERFIL
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}
