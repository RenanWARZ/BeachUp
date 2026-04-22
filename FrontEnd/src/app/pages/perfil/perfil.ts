import { Component } from '@angular/core';

@Component({
  selector: 'app-perfil',
  imports: [],
  templateUrl: './perfil.html',
  styleUrl: './perfil.css',
})
export class Perfil {

  user = {
    nome: 'João Silva',
    avatar: 'assets/user.jpg',
    nivel: 'Intermediário',
    partidas: 120,
    vitorias: 78,
    rating: 4.8,
    ranking: 15,
    xp: 70,
    torneios: 12,
    titulos: 5,
    winStreak: 6,
    bio: 'Jogador competitivo de beach tennis focado em evolução constante.',
    badges: ['🔥 Em alta', '🏅 Top 20']
  };

  jogos = [
    { data: '23/04', local: 'Arena Central', status: 'Confirmado' },
    { data: '25/04', local: 'Beach Club', status: 'Pendente' }
  ];

  editarPerfil() {
    console.log('Editar perfil');
    // navegar ou abrir modal
  }

  verHistorico() {
    console.log('Ver histórico');
  }
}
