import { AfterViewInit, Component, ViewChild, ElementRef } from '@angular/core';
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

export class Home implements AfterViewInit{
  constructor(public navigation: NavigationService) {}

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }

  @ViewChild('sobreVideo') sobreVideo!: ElementRef<HTMLVideoElement>;

  ngAfterViewInit() {
    const video = this.sobreVideo.nativeElement;

    video.addEventListener('mouseenter', () => {
      video.play().catch((err) => {
        console.log('Play não iniciado automaticamente:', err);
      });
    });

    video.addEventListener('mouseleave', () => {
      video.pause();
      video.currentTime = 0;
    });
  }
}
