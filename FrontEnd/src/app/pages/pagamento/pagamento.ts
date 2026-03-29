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

  finalizarPagamento() {
    console.log('clicou');

    if (this.metodoSelecionado === 'cartao' && this.formPagamento.invalid) {
      this.mensagem = '❌ Preencha os campos!';
      return;
    }

    const dados = this.formPagamento.value;

    console.log('Dados do formulário:', dados);
    console.log('Nome:', dados.nome);
    console.log('Cartão:', dados.numeroCartao);
    console.log('Validade:', dados.validade);
    console.log('Cpf:', dados.cpf);

    this.mensagem = '⏳ Processando...';

    setTimeout(() => {
      console.log('indo para sucesso');
      this.navigation.irPara('pagamento-sucesso');
    }, 1000);
  }
  irPara(rota: string) {
    this.navigation.irPara(rota);
  }
}
