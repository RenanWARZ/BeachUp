import { DatePipe } from '@angular/common';
import { Component } from '@angular/core';

interface Reserva {
  hora: string;
  cliente: string;
  quadra: number;
  duracao: string;
  vip?: boolean;
  disponivel?: boolean;
}

interface ProximaReserva {
  hora: string;
  cliente: string;
  quadra: number;
  duracao: string;
}

interface FaturamentoDia {
  dia: string;
  percent: number;
}

interface Stats {
  reservasHoje: number;
  faturamento: string;
  quadrasAtivas: number;
  clientes: number;
}

@Component({
  selector: 'app-dashboard-dono',
  imports: [DatePipe],
  templateUrl: './dashboard-dono.html',
  styleUrl: './dashboard-dono.css',
})
export class DashboardDono {
  now = new Date();

  ngOnInit() {
    setInterval(() => {
      this.now = new Date();
    }, 60000); 
  }

  stats: Stats = {
    reservasHoje: 14,
    faturamento: '3.820',
    quadrasAtivas: 6,
    clientes: 342,
  };

  reservas: Reserva[] = [
    { hora: '08:00', cliente: 'Lucas Andrade', quadra: 1, duracao: '1h', vip: true },
    { hora: '08:00', cliente: 'Mariana Costa', quadra: 3, duracao: '1h' },
    { hora: '09:00', cliente: 'Pedro Lima', quadra: 2, duracao: '1h30' },
    { hora: '10:00', cliente: 'Ana Beatriz', quadra: 5, duracao: '1h' },
    { hora: '10:30', cliente: 'Rafael Souza', quadra: 4, duracao: '2h' },
    { hora: '11:00', cliente: 'Camila Rocha', quadra: 1, duracao: '1h' },
    { hora: '12:00', cliente: 'Grupo Torres', quadra: 6, duracao: '2h' },
    { hora: '13:00', cliente: 'Thiago Neves', quadra: 2, duracao: '1h' },
    { hora: '14:00', cliente: 'Disponível', quadra: 3, duracao: '', disponivel: true },
  ];

  faturamentoSemana: FaturamentoDia[] = [
    { dia: 'Seg', percent: 55 },
    { dia: 'Ter', percent: 70 },
    { dia: 'Qua', percent: 45 },
    { dia: 'Qui', percent: 90 },
    { dia: 'Sex', percent: 80 },
    { dia: 'Sáb', percent: 100 },
    { dia: 'Dom', percent: 75 },
  ];

  proximas: ProximaReserva[] = [
    { hora: '14:30', cliente: 'Felipe Gomes', quadra: 2, duracao: '1h' },
    { hora: '15:00', cliente: 'Julia Martins', quadra: 5, duracao: '1h30' },
    { hora: '16:00', cliente: 'Bruno Alves', quadra: 1, duracao: '2h' },
    { hora: '17:00', cliente: 'Grupo Praia', quadra: 6, duracao: '1h' },
  ];
}
