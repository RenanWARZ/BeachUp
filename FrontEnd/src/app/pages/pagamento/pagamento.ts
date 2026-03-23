import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-pagamento',
  imports: [CommonModule],
  standalone: true,
  templateUrl: './pagamento.html',
  styleUrls: ['./pagamento.css'],
})

export class Pagamento {
  metodoSelecionado: 'cartao' | 'pix' = 'cartao';

  // copiarPix(valor: string) {
  //   navigator.clipboard.writeText(valor);
  //   alert('Chave PIX copiada!');
  // }

  constructor(public navigation: NavigationService) {}

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
  
}
