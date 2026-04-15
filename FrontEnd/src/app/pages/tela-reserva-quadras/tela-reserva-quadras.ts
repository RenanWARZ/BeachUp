import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NavigationService } from '../../shared/services/navigation';

// Interface para as quadras disponíveis
interface Quadra {
  id: number;
  label: string;
  tag?: string;
}

// Interface para as reservas feitas
interface Reserva {
  id: string;
  quadraId: number;
  quadraNome: string;
  data: string;
  horaInicio: string;
  horaFim: string;
  duracao: string;
  preco: number;
}

@Component({
  selector: 'app-reserva',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './tela-reserva-quadras.html',
  styleUrls: ['./tela-reserva-quadras.css'],
})
export class TelaReservaQuadras {
  // Preço a cada 30 minutos
  readonly PRECO_POR_30_MIN = 80;

  // Lista de quadras disponíveis
  quadras: Quadra[] = [
    { id: 1, label: 'Quadra 1' },
    { id: 2, label: 'Quadra 2' },
    { id: 3, label: 'Quadra 3' },
    { id: 4, label: 'Quadra 4', tag: 'Coberta' },
    { id: 5, label: 'Quadra 5', tag: 'Coberta' },
  ];

  // Horários disponíveis (08:00 até 22:00)
  todosHorarios: string[] = [];
  horariosFim: string[] = [];

  // Campos do formulário
  quadraSelecionada: number | null = null;
  dataSelecionada = '';
  horaInicio = '';
  horaFim = '';
  hoje = '';

  // Lista de reservas feitas
  reservas: Reserva[] = [];

  // Controle do dialog de exclusão
  mostrarDialogExclusao = false;
  reservaParaExcluir: Reserva | null = null;

  // Controle de edição — guarda o ID da reserva sendo editada
  editandoId: string | null = null;

  constructor(public navigation: NavigationService) {
    // Gera horários de 08:00 a 22:00 (intervalos de 30 min)
    for (let h = 8; h <= 22; h++) {
      this.todosHorarios.push(this.completarZero(h) + ':00');
      if (h < 22) this.todosHorarios.push(this.completarZero(h) + ':30');
    }
    this.horariosFim = [...this.todosHorarios];
    this.hoje = new Date().toISOString().split('T')[0];
  }

  // Adiciona zero à esquerda (ex: 8 -> "08")
  private completarZero(n: number): string {
    return String(n).padStart(2, '0');
  }

  // Converte horário "HH:MM" para minutos totais
  private horarioParaMinutos(t: string): number {
    const [h, m] = t.split(':').map(Number);
    return h * 60 + m;
  }

  // Seleciona uma quadra
  selecionarQuadra(id: number): void {
    this.quadraSelecionada = id;
  }

  // Quando muda o horário de início, filtra os horários de término
  aoMudarHoraInicio(): void {
    this.horaFim = '';
    if (this.horaInicio) {
      const inicioMin = this.horarioParaMinutos(this.horaInicio);
      this.horariosFim = this.todosHorarios.filter((t) => this.horarioParaMinutos(t) > inicioMin);
    } else {
      this.horariosFim = [...this.todosHorarios];
    }
  }

  // Validação dos horários selecionados
  get validacao(): string | null {
    if (!this.horaInicio || !this.horaFim) return null;
    const inicio = this.horarioParaMinutos(this.horaInicio);
    const fim = this.horarioParaMinutos(this.horaFim);
    if (fim <= inicio) return 'O horário final deve ser maior que o inicial.';
    if (fim - inicio < 30) return 'A reserva deve ter no mínimo 30 minutos.';
    return null;
  }

  // Calcula o preço total da reserva
  get precoTotal(): number | null {
    if (!this.horaInicio || !this.horaFim || this.validacao) return null;
    const diferenca =
      this.horarioParaMinutos(this.horaFim) - this.horarioParaMinutos(this.horaInicio);
    return (diferenca / 30) * this.PRECO_POR_30_MIN;
  }

  // Calcula a duração da reserva (ex: "1h30")
  get duracao(): string | null {
    if (!this.horaInicio || !this.horaFim || this.validacao) return null;
    const diferenca =
      this.horarioParaMinutos(this.horaFim) - this.horarioParaMinutos(this.horaInicio);
    const horas = Math.floor(diferenca / 60);
    const minutos = diferenca % 60;
    if (horas === 0) return `${minutos}min`;
    if (minutos === 0) return `${horas}h`;
    return `${horas}h${minutos}`;
  }

  // Verifica se pode reservar (todos os campos preenchidos e sem erro)
  get podeReservar(): boolean {
    return !!(
      this.dataSelecionada &&
      this.horaInicio &&
      this.horaFim &&
      this.quadraSelecionada &&
      !this.validacao
    );
  }

  // Formata preço para o padrão brasileiro (ex: 160.00 -> "160,00")
  formatarPreco(valor: number): string {
    return valor.toFixed(2).replace('.', ',');
  }

  // Formata data de "2026-04-07" para "07/04/2026"
  formatarDataBR(dataStr: string): string {
    const [ano, mes, dia] = dataStr.split('-');
    return `${dia}/${mes}/${ano}`;
  }

  // Limpa todos os campos do formulário
  private limparFormulario(): void {
    this.quadraSelecionada = null;
    this.dataSelecionada = '';
    this.horaInicio = '';
    this.horaFim = '';
    this.horariosFim = [...this.todosHorarios];
    this.editandoId = null;
  }

  // Cria uma nova reserva ou salva a edição
  reservar(): void {
    if (!this.podeReservar || this.precoTotal === null || this.duracao === null) return;

    const quadra = this.quadras.find((q) => q.id === this.quadraSelecionada)!;

    if (this.editandoId) {
      // Está editando — atualiza a reserva existente
      this.reservas = this.reservas.map((r) => {
        if (r.id === this.editandoId) {
          return {
            ...r,
            quadraId: this.quadraSelecionada!,
            quadraNome: quadra.label,
            data: this.dataSelecionada,
            horaInicio: this.horaInicio,
            horaFim: this.horaFim,
            duracao: this.duracao!,
            preco: this.precoTotal!,
          };
        }
        return r;
      });
    } else {
      // Criando nova reserva
      const novaReserva: Reserva = {
        id: crypto.randomUUID(),
        quadraId: this.quadraSelecionada!,
        quadraNome: quadra.label,
        data: this.dataSelecionada,
        horaInicio: this.horaInicio,
        horaFim: this.horaFim,
        duracao: this.duracao,
        preco: this.precoTotal,
      };
      this.reservas.push(novaReserva);
    }

    this.limparFormulario();
  }

  // Preenche o formulário com os dados da reserva para editar
  editarReserva(reserva: Reserva): void {
    this.editandoId = reserva.id;
    this.quadraSelecionada = reserva.quadraId;
    this.dataSelecionada = reserva.data;
    this.horaInicio = reserva.horaInicio;

    // Atualiza os horários de fim disponíveis
    const inicioMin = this.horarioParaMinutos(reserva.horaInicio);
    this.horariosFim = this.todosHorarios.filter((t) => this.horarioParaMinutos(t) > inicioMin);

    this.horaFim = reserva.horaFim;

    // Rola a página para o topo do formulário
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  // Cancela a edição e limpa o formulário
  cancelarEdicao(): void {
    this.limparFormulario();
  }

  // Abre o dialog de confirmação de exclusão
  abrirDialogExclusao(reserva: Reserva): void {
    this.reservaParaExcluir = reserva;
    this.mostrarDialogExclusao = true;
  }

  // Confirma a exclusão da reserva
  confirmarExclusao(): void {
    if (!this.reservaParaExcluir) return;

    // Se estava editando a reserva que foi excluída, cancela a edição
    if (this.editandoId === this.reservaParaExcluir.id) {
      this.limparFormulario();
    }

    this.reservas = this.reservas.filter((r) => r.id !== this.reservaParaExcluir!.id);
    this.mostrarDialogExclusao = false;
    this.reservaParaExcluir = null;
  }

  // Cancela a exclusão e fecha o dialog
  cancelarExclusao(): void {
    this.mostrarDialogExclusao = false;
    this.reservaParaExcluir = null;
  }
}
