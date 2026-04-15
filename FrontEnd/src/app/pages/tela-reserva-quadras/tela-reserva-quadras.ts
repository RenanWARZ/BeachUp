import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NavigationService } from '../../shared/services/navigation';

interface Court {
  id: number;
  label: string;
  tag?: string;
}

@Component({
  selector: 'app-reserva',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './tela-reserva-quadras.html',
  styleUrls: ['./tela-reserva-quadras.css'],
})
export class TelaReservaQuadras {

  readonly PRICE_PER_30_MIN = 80;

  courts: Court[] = [
    { id: 1, label: 'Quadra 1' },
    { id: 2, label: 'Quadra 2' },
    { id: 3, label: 'Quadra 3' },
    { id: 4, label: 'Quadra 4', tag: 'Coberta' },
    { id: 5, label: 'Quadra 5', tag: 'Coberta' },
  ];

  timeSlots: string[] = [];
  endTimeSlots: string[] = [];

  selectedCourt: number | null = null;
  selectedDate = '';
  startTime = '';
  endTime = '';
  today = '';

  constructor(public navigation: NavigationService) {
    // Gerar slots de 08:00 a 22:00
    for (let h = 8; h <= 22; h++) {
      this.timeSlots.push(this.pad(h) + ':00');
      if (h < 22) this.timeSlots.push(this.pad(h) + ':30');
    }
    this.endTimeSlots = [...this.timeSlots];
    this.today = new Date().toISOString().split('T')[0];

  }

  private pad(n: number): string {
    return String(n).padStart(2, '0');
  }

  private timeToMinutes(t: string): number {
    const [h, m] = t.split(':').map(Number);
    return h * 60 + m;
  }

  selectCourt(id: number): void {
    this.selectedCourt = id;
  }

  onStartTimeChange(): void {
    this.endTime = '';
    if (this.startTime) {
      const startMin = this.timeToMinutes(this.startTime);
      this.endTimeSlots = this.timeSlots.filter((t) => this.timeToMinutes(t) > startMin);
    } else {
      this.endTimeSlots = [...this.timeSlots];
    }
  }

  get validation(): string | null {
    if (!this.startTime || !this.endTime) return null;
    const start = this.timeToMinutes(this.startTime);
    const end = this.timeToMinutes(this.endTime);
    if (end <= start) return 'O horário final deve ser maior que o inicial.';
    if (end - start < 30) return 'A reserva deve ter no mínimo 30 minutos.';
    return null;
  }

  get totalPrice(): number | null {
    if (!this.startTime || !this.endTime || this.validation) return null;
    const diff = this.timeToMinutes(this.endTime) - this.timeToMinutes(this.startTime);
    return (diff / 30) * this.PRICE_PER_30_MIN;
  }

  get duration(): string | null {
    if (!this.startTime || !this.endTime || this.validation) return null;
    const diff = this.timeToMinutes(this.endTime) - this.timeToMinutes(this.startTime);
    const hours = Math.floor(diff / 60);
    const mins = diff % 60;
    if (hours === 0) return `${mins}min`;
    if (mins === 0) return `${hours}h`;
    return `${hours}h${mins}`;
  }

  get canReserve(): boolean {
    return !!(
      this.selectedDate &&
      this.startTime &&
      this.endTime &&
      this.selectedCourt &&
      !this.validation
    );
  }

  formatPrice(value: number): string {
    return value.toFixed(2).replace('.', ',');
  }

  reservar(): void {
    if (!this.canReserve) return;
    const court = this.courts.find((c) => c.id === this.selectedCourt);
    alert(
      `Reserva confirmada!\n\n${court?.label}\nData: ${this.selectedDate}\nHorário: ${this.startTime} - ${this.endTime}\nValor: R$ ${this.formatPrice(this.totalPrice!)}`,
    );
  }
}

