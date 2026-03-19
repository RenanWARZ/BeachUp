import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';
import { MatIcon } from "@angular/material/icon";

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [MatIcon],
  templateUrl: './login.html',
  styleUrl: './login.css',
})

export class Login {
  isRegister = false;

  toggle() {
    this.isRegister = !this.isRegister;
  }

  constructor(public navigation: NavigationService){}

      irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
