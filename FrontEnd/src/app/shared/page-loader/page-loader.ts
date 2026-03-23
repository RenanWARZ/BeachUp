import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIcon } from "@angular/material/icon";


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
