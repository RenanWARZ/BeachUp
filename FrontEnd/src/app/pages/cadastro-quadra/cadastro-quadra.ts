import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NavigationService } from '../../shared/services/navigation';
import { QuadraService } from '../../shared/services/quadra.service';
import { Quadra } from '../../shared/services/models/quadra.model';

@Component({
  selector: 'app-cadastro-quadra',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './cadastro-quadra.html',
  styleUrls: ['./cadastro-quadra.css'],
})
export class CadastroQuadra implements OnInit {
  quadras: Quadra[] = [];
  exibirLista: boolean = false;
  quadraForm: FormGroup;
  editando: boolean = false;
  idEditando: number | null = null;

  constructor(
    public navigation: NavigationService,
    private quadraService: QuadraService,
    private formBuilder: FormBuilder,
  ) {
    this.quadraForm = this.formBuilder.group({
      nome: ['', Validators.required],
      descricao: [''],
      horarioInicio: ['00:00'],
      horarioFim: ['00:00'],
      valorPorHora: ['', [Validators.required, Validators.min(0.01)]],
    });
  }

  ngOnInit() {
    this.carregarQuadras();
  }

  carregarQuadras() {
    this.quadras = this.quadraService.getQuadras();
  }

  publicarQuadra() {
    if (this.quadraForm.valid) {
      this.quadraService.addQuadra(this.quadraForm.value);
      this.carregarQuadras();
      this.limparFormulario();
      alert('Quadra publicada com sucesso!');
    } else {
      alert('Por favor, preencha os campos obrigatórios (Nome e Valor).');
    }
  }

  limparFormulario() {
    this.quadraForm.reset({
      valorPorHora: 0,
    });
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
  editarQuadra(quadra: Quadra) {
    this.editando = true;
    this.idEditando = quadra.id || null;

    this.quadraForm.patchValue({
      nome: quadra.nome,
      descricao: quadra.descricao,
      horarioInicio: quadra.horarioInicio,
      horarioFim: quadra.horarioFim,
      valorPorHora: quadra.valorPorHora,
    });

    this.exibirLista = false;
  }

  atualizarQuadra() {
    if (this.quadraForm.valid && this.idEditando !== null) {
      const quadraAtualizada: Quadra = {
        ...this.quadraForm.value,
        id: this.idEditando,
      };

      this.quadraService.updateQuadra(quadraAtualizada);

      this.carregarQuadras();
      this.limparFormulario();

      this.editando = false;
      this.idEditando = null;

      alert('Quadra atualizada com sucesso!');
    } else {
      alert('Erro ao atualizar quadra.');
    }
  }
}
