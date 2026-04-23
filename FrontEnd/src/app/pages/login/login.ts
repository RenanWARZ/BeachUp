import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';
import {FormBuilder,FormGroup,ReactiveFormsModule,Validators,AbstractControl,ValidationErrors,} from '@angular/forms';
import { NavigationService } from '../../shared/services/navigation';
import { AuthService } from '../../shared/services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, RouterModule, ReactiveFormsModule],
  templateUrl: './login.html',
  styleUrls: ['./login.css'],
})

export class Login implements OnInit {
  Isregistro = false;
  mostrarSenha = false;
  carregando = false;
  mensagemErro = '';
  mensagemSucesso = '';
  mostrarDados = false;
  dadosCadastrados: any = null;

  private forms = inject(FormBuilder);
  private route = inject(ActivatedRoute);
  private authService = inject(AuthService);

  constructor(public navigation: NavigationService) {}

  loginForm!: FormGroup;
  registerForm!: FormGroup;

  ngOnInit(): void {
    this.inicializarForms();

    this.route.url.subscribe((url) => {
      this.Isregistro = url.some((segment) => segment.path === 'cadastrar');
      this.limparMensagens();
    });
  }

  inicializarForms(): void {
    this.loginForm = this.forms.group({
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required, Validators.minLength(6)]],
    });

    this.registerForm = this.forms.group(
      {
        nome: ['', [Validators.required, Validators.minLength(3)]],
        email: ['', [Validators.required, Validators.email]],
        senha: ['', [Validators.required, Validators.minLength(6)]],
        confirmarSenha: ['', [Validators.required]],
      },
      { validators: this.senhasIguaisValidator },
    );
  }

  senhasIguaisValidator(form: AbstractControl): ValidationErrors | null {
    const senha = form.get('senha')?.value;
    const confirmarSenha = form.get('confirmarSenha')?.value;

    if (!senha || !confirmarSenha) return null;

    return senha === confirmarSenha ? null : { senhasDiferentes: true };
  }

  toggle(): void {
    this.Isregistro = !this.Isregistro;
    this.limparMensagens();
    this.loginForm.reset();
    // this.registerForm.reset();
    this.mostrarSenha = false;
    this.mostrarDados = false;
    this.dadosCadastrados = null;
  }

  irPara(rota: string): void {
    this.navigation.irPara(rota);
  }

  toggleSenha(): void {
    this.mostrarSenha = !this.mostrarSenha;
  }

  limparMensagens(): void {
    this.mensagemErro = '';
    this.mensagemSucesso = '';
  }

  /********************************************** */
  criarConta(): void {
    this.limparMensagens();

    if (this.registerForm.invalid) {
      this.registerForm.markAllAsTouched();
      return;
    }

    this.carregando = true;

    const { nome, email, senha, confirmarSenha } = this.registerForm.value;
    this.dadosCadastrados = { nome, email, senha, confirmarSenha };

    this.authService.criarConta({ nome, email, senha }).subscribe({
      next: (resposta) => {
        console.log('Usuário criado com sucesso:', resposta);
        this.mensagemSucesso = 'Conta criada com sucesso!';

        // SALVA ANTES DE RESETAR
        const { nome, email, senha, confirmarSenha } = this.registerForm.value;
        this.dadosCadastrados = { nome, email, senha, confirmarSenha };
        this.mostrarDados = false;

        // this.registerForm.reset();
        this.carregando = false;
        this.mostrarDados = true;
      },
      error: (err) => {
        console.error('Erro ao criar conta:', err);
        this.mensagemErro = err?.error?.message || 'Erro ao cadastrar usuário.';
        this.carregando = false;
      },
    });
  }
  /********************************************** */

  BotaoDados(): void {
    this.mostrarDados = true;
    this.limparMensagens();

    const { nome, email, senha, confirmarSenha } = this.registerForm.value;
    this.dadosCadastrados = { nome, email, senha, confirmarSenha };
  }

  entrar(): void {
    this.limparMensagens();

    if (this.loginForm.invalid) {
      this.loginForm.markAllAsTouched();
      return;
    }

    this.carregando = true;

    const { email, senha } = this.loginForm.value;

    this.authService.login({ email, senha }).subscribe({
      next: (res) => {
        console.log('Login realizado com sucesso:', res);
        this.mensagemSucesso = 'Login realizado com sucesso!';
        this.carregando = false;

        this.navigation.irPara('home');
      },
      error: (err) => {
        console.error('Erro no login:', err);
        this.mensagemErro = err?.error?.message || 'Email ou senha inválidos.';
        this.carregando = false;
      },
    });
  }

  get lf() {
    return this.loginForm.controls;
  }

  get registrar() {
    return this.registerForm.controls;
  }
}
