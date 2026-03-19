import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';

@Component({
  selector: 'app-sobre',
  standalone: true,
  imports: [],
  templateUrl: './sobre.html',
  styleUrl: './sobre.css',
})
export class Sobre {
  isRegister = false;

   toggle() {
     this.isRegister = !this.isRegister;
   }

   constructor(public navigation: NavigationService){}

       irPara(rota: string) {
     this.navigation.irPara(rota);
   }
}
