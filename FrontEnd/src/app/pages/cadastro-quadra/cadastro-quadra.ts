import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NavigationService } from '../../shared/services/navigation';
import { QuadraService } from '../../shared/services/quadra.service';
import { Quadra } from '../../shared/services/models/quadra.model';

@Component({
  selector: 'app-cadastro-quadra',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './cadastro-quadra.html',
  styleUrl: './cadastro-quadra.css',
})
export class CadastroQuadra implements OnInit {
  quadra: Quadra = {
    nome: '',
    descricao: '',
    horarioInicio: '',
    horarioFim: '',
    valorPorHora: 0,
  };

  quadras: Quadra[] = [];
  exibirLista: boolean = false;

  constructor(
    public navigation: NavigationService,
    private quadraService: QuadraService
  ) {}

  ngOnInit() {
    this.carregarQuadras();
  }

  carregarQuadras() {
    this.quadras = this.quadraService.getQuadras();
  }

  publicarQuadra() {
    if (this.quadra.nome && this.quadra.valorPorHora > 0) {
      this.quadraService.addQuadra({ ...this.quadra });
      this.carregarQuadras();
      this.limparFormulario();
      alert('Quadra publicada com sucesso!');
    } else {
      alert('Por favor, preencha os campos obrigatórios (Nome e Valor).');
    }
  }

  limparFormulario() {
    this.quadra = {
      nome: '',
      descricao: '',
      horarioInicio: '',
      horarioFim: '',
      valorPorHora: 0,
    };
  }

  toggleView() {
    this.exibirLista = !this.exibirLista;
  }

  excluirQuadra(id: number | undefined) {
    if (id && confirm('Deseja realmente excluir esta quadra?')) {
      this.quadraService.deleteQuadra(id);
      this.carregarQuadras();
    }
  }

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
