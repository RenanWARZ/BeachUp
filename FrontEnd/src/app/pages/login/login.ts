import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators,
  AbstractControl,
  ValidationErrors,
} from '@angular/forms';

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
  isRegister = false;
  mostrarSenha = false;
  carregando = false;
  mensagemErro = '';
  mensagemSucesso = '';

  private fb = inject(FormBuilder);
  private route = inject(ActivatedRoute);
  private authService = inject(AuthService);

  constructor(public navigation: NavigationService) {}

  loginForm!: FormGroup;
  registerForm!: FormGroup;

  ngOnInit(): void {
    this.inicializarForms();

    this.route.url.subscribe((url) => {
      this.isRegister = url.some((segment) => segment.path === 'cadastrar');
      this.limparMensagens();
    });
  }

  inicializarForms(): void {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required, Validators.minLength(6)]],
    });

    this.registerForm = this.fb.group(
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
    this.isRegister = !this.isRegister;
    this.limparMensagens();
    this.loginForm.reset();
    this.registerForm.reset();
    this.mostrarSenha = false;
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

  criarConta(): void {
    this.limparMensagens();

    if (this.registerForm.invalid) {
      this.registerForm.markAllAsTouched();
      return;
    }

    this.carregando = true;

    const { nome, email, senha } = this.registerForm.value;

    this.authService.criarConta({ nome, email, senha }).subscribe({
      next: (res) => {
        console.log('Usuário criado com sucesso:', res);
        this.mensagemSucesso = 'Conta criada com sucesso!';
        this.registerForm.reset();
        this.carregando = false;

        // opcional: voltar para login
        this.isRegister = false;
      },
      error: (err) => {
        console.error('Erro ao criar conta:', err);
        this.mensagemErro = err?.error?.message || 'Erro ao cadastrar usuário.';
        this.carregando = false;
      },
    });
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

        // exemplo: salvar token
        // localStorage.setItem('token', res.token);

        // navegar após login
        // this.navigation.irPara('home');
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

  get rf() {
    return this.registerForm.controls;
  }
}
