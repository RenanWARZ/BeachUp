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


  editandoIndex: number | null = null;

  constructor(public navigation: NavigationService) {}

  salvar() {
    if (!this.avaliacao.nome || !this.avaliacao.comentario) {
      alert('Preencha todos os campos!');
      return;
    }

    if (this.avaliacao.nota < 0 || this.avaliacao.nota > 5) {
      alert('A nota deve ser entre 0 e 5');
      return;
    }

    if (this.editandoIndex !== null) {
      this.avaliacoes[this.editandoIndex] = { ...this.avaliacao };
      this.editandoIndex = null;
    } else {
      this.avaliacoes.push({ ...this.avaliacao });
    }


    this.avaliacao = {
      nome: '',
      comentario: '',
      nota: 0
    };
  }

  editar(index: number) {
    this.avaliacao = { ...this.avaliacoes[index] };
    this.editandoIndex = index;

    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  deletar(index: number) {
    const confirmado = confirm('Tem certeza que deseja excluir esta avaliação?');
    if (confirmado) {
      this.avaliacoes.splice(index, 1);

      if (this.editandoIndex === index) {
        this.cancelarEdicao();
      }
    }
  }

  cancelarEdicao() {
    this.editandoIndex = null;
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


interface Avaliacao {
  nome: String;
  nota: number;
  comentario: String;
}
