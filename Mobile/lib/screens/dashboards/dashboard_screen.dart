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
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          ),
        ],
      ),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            Positioned.fill(
            child: Image.asset(
              'assets/fundodashboard1.png',
              fit: BoxFit.cover,
            ),
          ),

         Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 255, 241, 181).withValues(alpha: 0.75), 
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá, João!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF121212)
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Veja como estão suas quadras hoje',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF121212)
                          ),
                        )
                      ],
                    )
                     
                  
                    ],

                  )
                ],
              ),
            )
            
          )
        ],
      ),
    
    ));

  }
}

         