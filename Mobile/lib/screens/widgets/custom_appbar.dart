import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        children: [
          Image.asset('assets/logo1.png', height: 28),
          const SizedBox(width: 6),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Beach ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: 'Up',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Define a altura padrão da AppBar para o Flutter
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
