import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { PageLoader } from './shared/page-loader/page-loader';
import { LoaderService } from './shared/page-loader/loader.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, PageLoader],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {

  constructor(public loaderService: LoaderService) {}
}
