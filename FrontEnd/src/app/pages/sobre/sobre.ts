import { Component, Inject, PLATFORM_ID } from '@angular/core';
import { MatIcon } from '@angular/material/icon';
import { Router } from '@angular/router';
import { LoaderService } from '../../shared/page-loader/loader.service';

@Component({
  selector: 'app-sobre',
  standalone: true,
  imports: [],
  templateUrl: './sobre.html',
  styleUrl: './sobre.css',
})
export class Sobre {
  constructor(
    @Inject(PLATFORM_ID) private platformId: object,
    private router: Router,
    private loader: LoaderService,
  ) {}

  irPara(rota: string) {
    this.loader.show();

    setTimeout(() => {
      this.router.navigate([rota]).then(() => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
        this.loader.hide();
      });
    }, 1000);
  }
}
