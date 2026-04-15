import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Team } from '../../shared/services/models/team.model';
import { TeamService } from '../../shared/services/team.service';
import { NavigationService } from '../../shared/services/navigation';

@Component({
  selector: 'app-criacao-de-telas',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './criacao-de-telas.html',
  styleUrl: './criacao-de-telas.css',
})
export class CriacaoDeTelas implements OnInit {
  public team: Team = this.limparFormulario();
  public teams: Team[] = [];
  public exibirLista: boolean = false;
  public editando: boolean = false;

  constructor(
    private teamService: TeamService,
    private navigationService: NavigationService
  ) {}

  ngOnInit(): void {
    this.carregarTeams();
  }

  carregarTeams(): void {
    this.teams = this.teamService.getTeams();
  }

  publicarTeam(): void {
    if (this.team.nome && this.team.nivel) {
      if (this.editando) {
        this.teamService.updateTeam(this.team);
        alert('Time atualizado com sucesso!');
      } else {
        this.teamService.addTeam(this.team);
        alert('Time criado com sucesso!');
      }
      this.carregarTeams();
      this.cancelarEdicao();
      this.exibirLista = true;
    } else {
      alert('Por favor, preencha o nome e o nível do time.');
    }
  }

  limparFormulario(): Team {
    return {
      nome: '',
      descricao: '',
      nivel: '',
      maxJogadores: 4,
      privado: false
    };
  }

  editarTeam(t: Team): void {
    this.team = { ...t };
    this.editando = true;
    this.exibirLista = false;
  }

  cancelarEdicao(): void {
    this.team = this.limparFormulario();
    this.editando = false;
  }

  toggleView(): void {
    this.exibirLista = !this.exibirLista;
    if (!this.exibirLista && !this.editando) {
      this.cancelarEdicao();
    }
  }

  excluirTeam(id: number | undefined): void {
    if (id && confirm('Deseja realmente excluir este time?')) {
      this.teamService.deleteTeam(id);
      this.carregarTeams();
    }
  }

  irPara(rota: string): void {
    this.navigationService.irPara(rota);
  }
}
