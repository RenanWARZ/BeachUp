import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';

@Component({
  selector: 'app-avaliacoes',
  imports: [],
  templateUrl: './avaliacoes.html',
  styleUrls: ['./avaliacoes.css']
})

export class Avaliacoes {

  constructor(public navigation: NavigationService) {}

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
