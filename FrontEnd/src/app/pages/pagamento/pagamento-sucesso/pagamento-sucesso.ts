import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavigationService } from '../../../shared/services/navigation';

@Component({
  selector: 'app-pagamento-sucesso',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './pagamento-sucesso.html',
  styleUrls: ['./pagamento-sucesso.css'],
})
export class PagamentoSucesso {
  constructor(private navigation: NavigationService) {}

  dataAtual: string = new Date().toLocaleDateString();
  transacaoId: number = Math.floor(Math.random() * 100000);

  voltarHome() {
    this.navigation.irPara('home');
  }
  
  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
