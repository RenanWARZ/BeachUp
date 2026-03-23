import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';

@Component({
  selector: 'app-telaredirecionamento',
  imports: [],
  templateUrl: './telaredirecionamento.html',
  styleUrl: './telaredirecionamento.css',
})

export class Telaredirecionamento {
   constructor(public navigation: NavigationService){}

       irPara(rota: string) {
     this.navigation.irPara(rota);
   }
   
}
