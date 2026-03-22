import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';
import { MatIcon } from '@angular/material/icon';

@Component({
  selector: 'app-cadastro-quadra',
  imports: [MatIcon],
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
