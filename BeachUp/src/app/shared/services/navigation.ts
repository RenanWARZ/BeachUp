import { Inject, Injectable, PLATFORM_ID } from '@angular/core';
import { isPlatformBrowser } from '@angular/common';
import { Router } from '@angular/router';
import { LoaderService } from '../page-loader/loader.service';

@Injectable({
  providedIn: 'root',
})
export class NavigationService {
  constructor(
    private router: Router,
    private loader: LoaderService,
    @Inject(PLATFORM_ID) private platformId: Object,
  ) {}

  irPara(rota: string, delay: number = 1000) {
    this.loader.show();

    setTimeout(() => {
      this.router
        .navigate([rota])
        .then(() => {
          if (isPlatformBrowser(this.platformId)) {
            window.scrollTo({ top: 0, behavior: 'smooth' });
          }

          this.loader.hide();
        })
        .catch(() => {
          this.loader.hide();
        });
    }, delay);
  }
}
