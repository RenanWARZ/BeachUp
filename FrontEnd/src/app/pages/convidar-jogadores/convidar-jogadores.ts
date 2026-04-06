import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NavigationService } from '../../shared/services/navigation';
import { ConviteService } from '../../shared/services/convite.service';
import { Convite, Jogador } from '../../shared/services/models/convite.model';

@Component({
  selector: 'app-convidar-jogadores',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './convidar-jogadores.html',
  styleUrl: './convidar-jogadores.css',
  
})
export class ConvidarJogadores implements OnInit {
  editando: boolean = false;
conviteEditandoId: number | null = null;
  anfitriao: string = '';
  novoJogador: string = '';
  jogadoresAdicionados: Jogador[] = [];

  exibirLista: boolean = false;
  linkGerado: string = '';
  copiado: boolean = false;
  validationMsg: string = '';

  convites: Convite[] = [];

  constructor(
    private navigation: NavigationService,
    private conviteService: ConviteService,
  ) {}

  ngOnInit(): void {
    this.carregarConvites();
  }

  irPara(rota: string): void {
    this.navigation.irPara(rota);
  }

  toggleView(): void {
    this.exibirLista = !this.exibirLista;
    if (this.exibirLista) {
      this.carregarConvites();
    }
  }

  adicionarJogador(): void {
    const nome = this.novoJogador.trim();

    if (!nome) return;

    if (this.jogadoresAdicionados.length >= 3) {
      this.validationMsg = 'Limite máximo de 3 participantes atingido.';
      return;
    }

    const jaExiste = this.jogadoresAdicionados.some(
      (j) => j.nome.toLowerCase() === nome.toLowerCase(),
    );

    if (jaExiste) {
      this.validationMsg = 'Este jogador já foi adicionado.';
      return;
    }

    if (this.anfitriao.trim().toLowerCase() === nome.toLowerCase()) {
      this.validationMsg = 'O anfitrião não pode ser adicionado como participante.';
      return;
    }

    this.jogadoresAdicionados.push({ nome });
    this.novoJogador = '';
    this.validationMsg = '';
    this.linkGerado = '';
  }

  removerJogador(index: number): void {
    this.jogadoresAdicionados.splice(index, 1);
    this.validationMsg = '';
    this.linkGerado = '';
  }

  get podeCriarConvite(): boolean {
    return this.anfitriao.trim().length > 0 && this.jogadoresAdicionados.length > 0;
  }

  gerarConvite(): void {
  if (!this.podeCriarConvite) return;

  const nomesJogadores = this.jogadoresAdicionados.map((j) => j.nome);
  const link = this.conviteService.gerarLinkWhatsapp(
    this.anfitriao.trim(),
    nomesJogadores
  );

  const convite: Convite = {
    id: this.conviteEditandoId || undefined,
    anfitriao: this.anfitriao.trim(),
    jogadores: [...this.jogadoresAdicionados],
    dataConvite: this.formatarData(new Date()),
    linkWhatsapp: link,
  };

  if (this.editando && this.conviteEditandoId !== null) {
    this.conviteService.editarConvite(convite);
  } else {
    this.conviteService.addConvite(convite);
  }

  this.resetForm();
  this.linkGerado = link;
  this.carregarConvites();
}

  copiarLink(): void {
    if (!this.linkGerado) return;
    navigator.clipboard.writeText(this.linkGerado).then(() => {
      this.copiado = true;
      setTimeout(() => (this.copiado = false), 2500);
    });
  }

  carregarConvites(): void {
    this.convites = this.conviteService.getConvites().reverse();
  }

  excluirConvite(id: number): void {
    if (confirm('Deseja realmente excluir este convite?')) {
      this.conviteService.deleteConvite(id);
      this.carregarConvites();
    }
  }

  getInitials(nome: string): string {
    if (!nome) return '?';
    const partes = nome.trim().split(' ');
    if (partes.length === 1) return partes[0].charAt(0).toUpperCase();
    return (partes[0].charAt(0) + partes[partes.length - 1].charAt(0)).toUpperCase();
  }

  private formatarData(data: Date): string {
    return data.toLocaleDateString('pt-BR', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit',
    });
  }
  editarConvite(convite: Convite): void {
  this.anfitriao = convite.anfitriao;
  this.jogadoresAdicionados = [...convite.jogadores];

  this.conviteEditandoId = convite.id!;
  this.editando = true;

  this.linkGerado = '';
  this.validationMsg = '';
}
resetForm(): void {
  this.anfitriao = '';
  this.novoJogador = '';
  this.jogadoresAdicionados = [];
  this.editando = false;
  this.conviteEditandoId = null;
}

}
