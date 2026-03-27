import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';

@Component({
  selector: 'app-cadastro-quadra',
  imports: [],
  templateUrl: './cadastro-quadra.html',
  styleUrl: './cadastro-quadra.css',
})
export class CadastroQuadra {
  constructor(public navigation: NavigationService) {}

  //icone
  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
