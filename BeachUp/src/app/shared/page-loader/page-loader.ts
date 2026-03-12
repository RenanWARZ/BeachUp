import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIcon } from '@angular/material/icon';
import { Injectable, signal } from '@angular/core';

@Component({
  selector: 'app-page-loader',
  standalone: true,
  imports: [CommonModule, MatIcon],
  templateUrl: './page-loader.html',
  styleUrl: './page-loader.css',
})
export class PageLoader {
  @Input() isVisible = false;
}

@Injectable({ providedIn: 'root' })
export class LoaderService {
  loading = signal(false);

  show() {
    this.loading.set(true);
  }

  hide() {
    this.loading.set(false);
  }
}
