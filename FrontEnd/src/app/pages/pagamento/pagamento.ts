import { Component } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-pagamento',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './pagamento.html',
  styleUrls: ['./pagamento.css'],
})
export class Pagamento {

  metodoSelecionado: 'cartao' | 'pix' = 'cartao';
  formPagamento!: FormGroup;
  mensagem: string = '';

  cartao: any = null;
  editando: boolean = false;

  constructor(
    public navigation: NavigationService,
    private fb: FormBuilder,
  ) {}

  ngOnInit() {
    this.formPagamento = this.fb.group({
      nome: ['', Validators.required],
      numeroCartao: ['', Validators.required],
      validade: ['', Validators.required],
      cvv: ['', Validators.required],
      cpf: ['', Validators.required],
    });
  }

  salvarCartao() {
    if (this.formPagamento.invalid) {
      this.mensagem = 'Preencha todos os campos!';
      return;
    }

    const dados = this.formPagamento.value;

    this.cartao = {
      nome: dados.nome,
      numero: '**** **** **** ' + dados.numeroCartao.slice(-4)
    };

    this.editando = false;
    this.formPagamento.reset();
    this.mensagem = 'Cartão salvo!';
  }

  editarCartao() {
    this.editando = true;

    if (this.cartao) {
      this.formPagamento.patchValue({
        nome: this.cartao.nome
      });
    }
  }

  deletarCartao() {
    this.cartao = null;
    this.editando = false;
    this.mensagem = 'Cartão removido!';
  }

  finalizarPagamento() {
    if (this.metodoSelecionado === 'cartao' && !this.cartao) {
      this.mensagem = 'Adicione um cartão!';
      return;
    }

    this.mensagem = 'Processando...';

    setTimeout(() => {
      this.navigation.irPara('pagamento-sucesso');
    }, 1000);
  }

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}