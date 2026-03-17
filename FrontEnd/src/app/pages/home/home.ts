import { Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatAnchor } from '@angular/material/button';
import { MatIcon } from '@angular/material/icon';
import { NavigationService } from '../../shared/services/navigation';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [MatCardModule, MatAnchor, MatIcon],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {
  constructor(public navigation: NavigationService) {}

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
