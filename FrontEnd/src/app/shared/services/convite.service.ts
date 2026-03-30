import { Injectable } from '@angular/core';
import { Convite } from './models/convite.model';

@Injectable({
  providedIn: 'root',
})
export class ConviteService {
  private readonly STORAGE_KEY = 'convites_data';

  getConvites(): Convite[] {
    const data = localStorage.getItem(this.STORAGE_KEY);
    return data ? JSON.parse(data) : [];
  }

  addConvite(convite: Convite): Convite {
    const convites = this.getConvites();
    convite.id = Date.now();
    convites.push(convite);
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(convites));
    return convite;
  }

  deleteConvite(id: number): void {
    const convites = this.getConvites().filter((c) => c.id !== id);
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(convites));
  }

  gerarLinkWhatsapp(anfitriao: string, jogadores: string[]): string {
    const nomes = jogadores.join(', ');
    const mensagem = encodeURIComponent(
      `🏐 *Convite BeachUp!*\n\nOlá! *${anfitriao}* está te convidando para uma partida de beach tennis!\n\n👥 *Participantes:* ${nomes}\n\nAcesse o app BeachUp e confirme sua presença! 🎾`
    );
    return `https://wa.me/?text=${mensagem}`;
  }
}
