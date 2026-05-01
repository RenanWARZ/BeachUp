import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,                         
      title: RichText(                        
  text: TextSpan(                       
    children: [
      TextSpan(
        text: 'Beach',                  
        style: TextStyle(
          color: Color(0xFF121212),    
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      TextSpan(
        text: 'Up',                     
        style: TextStyle(
          color: Color(0xFFFF6B00),     
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ],
  ),
),

    actions: [
      Padding(padding:
       const EdgeInsets.only(right: 16),
       child: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xFFFF6B00),
        child: const Text(
          'J',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
       ),
       )
       
    ],       
      ),
    );
  }
}