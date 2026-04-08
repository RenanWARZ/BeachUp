import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavigationService } from '../../../shared/services/navigation';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-pagamento-sucesso',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './pagamento-sucesso.html',
  styleUrls: ['./pagamento-sucesso.css'],
})
export class PagamentoSucesso {

  constructor(private navigation: NavigationService) {}

  dataAtual: string = new Date().toLocaleDateString();
  transacaoId: number = Math.floor(Math.random() * 100000);

  cartao = {
    nome: 'Matheus',
    numero: '**** **** **** 1234'
  };

  editando: boolean = false;

  editarCartao() {
    this.editando = true;
  }

  salvarCartao() {
    this.editando = false;
  }

  deletarCartao() {
    this.cartao = {
      nome: '',
      numero: ''
    };
  }

  voltarHome() {
    this.navigation.irPara('home');
  }
}