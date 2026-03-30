import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-avaliacoes',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './avaliacoes.html',
  styleUrls: ['./avaliacoes.css']
})

export class Avaliacoes {

  avaliacao: Avaliacao = {
    nome: '',
    comentario: '',
    nota: 0
  };

  avaliacoes: Avaliacao[] = [];


  constructor(public navigation: NavigationService) {}


  salvar() {
    // validação
    if (!this.avaliacao.nome || !this.avaliacao.comentario) {
      alert('Preencha todos os campos!');
      return;
    }

    if (this.avaliacao.nota < 0 || this.avaliacao.nota > 5) {
      alert('A nota deve ser entre 0 e 5');
      return;
    }

    // adiciona na lista
    this.avaliacoes.push({ ...this.avaliacao });

    // limpa formulário
    this.avaliacao = {
      nome: '',
      comentario: '',
      nota: 0
    };
  }

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}

//MODEL
interface Avaliacao {
  nome: String;
  nota: number;
  comentario: String;
}
