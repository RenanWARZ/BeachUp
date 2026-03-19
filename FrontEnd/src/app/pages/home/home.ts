import { Component } from '@angular/core';
import { MatButtonModule } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { NavigationService } from '../../shared/services/navigation';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [MatIcon,RouterLink, MatButtonModule],
  templateUrl: './home.html',
  styleUrl: './home.css',
})

export class Home {
  constructor(public navigation: NavigationService) {}

  /*Definir a rota IrPara */
  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
