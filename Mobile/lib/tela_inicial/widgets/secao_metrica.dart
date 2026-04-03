import 'package:flutter/material.dart';

class SecaoMetrica extends StatefulWidget {
  const SecaoMetrica({super.key});

  @override
  State<SecaoMetrica> createState() => _MetricaEstatsState();
}

class _MetricaEstatsState extends State<SecaoMetrica> {
  @override
  Widget build(BuildContext context) {
    // Definimos a cor laranja/dourado uma vez para reutilizar
    const Color brandColor = Colors.orange;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 5,
            childAspectRatio: 1.6, // Mantive o ajuste que aproxima as linhas
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              _status(Icons.person, '+350', 'Jogadores ativos', brandColor),
              _status(Icons.sports_tennis, '12 +', 'Quadras parceiras', brandColor),
              _status(Icons.calendar_month, '+40', 'Eventos realizados', brandColor),
              
            
              _status(
                null, // Passamos null no ícone padrão
                '98%',
                'Satisfação dos usuários',
                brandColor,
                // Passamos o widget de ESTRELAS personalizado como o parâmetro opcional 'customHeader'
                customHeader: _buildStarRating(brandColor), 
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 1. Função REUTILIZÁVEL para criar a LINHA DE ESTRELAS
Widget _buildStarRating(Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center, // Centraliza as estrelas
    mainAxisSize: MainAxisSize.min, // Ocupa o menor espaço possível
    children: [
      Icon(Icons.star, color: color, size: 24),        // Estrela cheia 1
      Icon(Icons.star, color: color, size: 24),        // Estrela cheia 2
      Icon(Icons.star, color: color, size: 24),        // Estrela cheia 3
      Icon(Icons.star, color: color, size: 24),        // Estrela cheia 4
      Icon(Icons.star_border, color: color, size: 24), // Estrela vazia 5
    ],
  );
}

// 2. Função _status ATUALIZADA para aceitar o header personalizado
Widget _status(IconData? icon, String quant, String texto, Color color, {Widget? customHeader}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Se houver um header personalizado (estrelas), usa ele; 
      // Caso contrário, usa o ícone padrão.
      customHeader ?? Icon(icon, color: color, size: 30),
      
      const SizedBox(height: 5), // Pequeno espaçador após o ícone/estrelas
      
      Text(
        quant,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1, // Remove espaços extras
        ),
      ),
      const SizedBox(height: 2),
      Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, color: Colors.white70), 
      ),
    ],
  );
}