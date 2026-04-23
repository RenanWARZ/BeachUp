import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import {
  AbstractControl,
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  ValidationErrors,
  Validators,
} from '@angular/forms';

import { NavigationService } from '../../shared/services/navigation';
import { AuthService } from '../../shared/services/auth.service';
import { UsuarioService } from '../../shared/services/usuario.service';

import { LoginPayload } from '../../shared/services/models/auth.model';
import { Usuario, UsuarioCreate, UsuarioUpdate } from '../../shared/services/models/usuario.model';

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

  loginForm!: FormGroup;
  registerForm!: FormGroup;

  usuarios: Usuario[] = [];
  modoEdicao = false;
  usuarioEmEdicaoId: number | null = null;

  private fb = inject(FormBuilder);
  private authService = inject(AuthService);
  private usuarioService = inject(UsuarioService);

  constructor(public navigation: NavigationService) {}

  ngOnInit(): void {
    this.inicializarForms();
    this.carregarUsuarios();
  }

  private inicializarForms(): void {
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

    if (!senha || !confirmarSenha) {
      return null;
    }

    return senha === confirmarSenha ? null : { senhasDiferentes: true };
  }

  carregarUsuarios(): void {
    this.usuarioService.listarUsuarios().subscribe({
      next: (usuarios) => {
        this.usuarios = usuarios;
      },
      error: () => {
        this.mensagemErro = 'Erro ao carregar usuários.';
      },
    });
  }

  toggle(): void {
    this.isRegister = !this.isRegister;
    this.mostrarSenha = false;
    this.limparMensagens();
    this.cancelarEdicao();
    this.loginForm.reset();
    this.registerForm.reset();
  }

  toggleSenha(): void {
    this.mostrarSenha = !this.mostrarSenha;
  }

  irPara(rota: string): void {
    this.navigation.irPara(rota);
  }

  limparMensagens(): void {
    this.mensagemErro = '';
    this.mensagemSucesso = '';
  }

  criarOuAtualizarConta(): void {
    this.limparMensagens();

    if (this.registerForm.invalid) {
      this.registerForm.markAllAsTouched();
      return;
    }

    this.carregando = true;

    if (this.modoEdicao && this.usuarioEmEdicaoId !== null) {
      const payload: UsuarioUpdate = {
        id: this.usuarioEmEdicaoId,
        nome: this.registerForm.value.nome,
        email: this.registerForm.value.email,
        senha: this.registerForm.value.senha,
      };

      this.usuarioService.atualizarUsuario(payload).subscribe({
        next: (response) => {
          this.carregando = false;
          this.mensagemSucesso = response.message;
          this.carregarUsuarios();
          this.cancelarEdicao();
          this.registerForm.reset();
        },
        error: (err) => {
          this.carregando = false;
          this.mensagemErro = err?.error?.message || 'Erro ao atualizar usuário.';
        },
      });

      return;
    }

    const payload: UsuarioCreate = {
      nome: this.registerForm.value.nome,
      email: this.registerForm.value.email,
      senha: this.registerForm.value.senha,
    };

    this.usuarioService.criarUsuario(payload).subscribe({
      next: (response) => {
        this.carregando = false;
        this.mensagemSucesso = response.message;
        this.carregarUsuarios();
        this.registerForm.reset();
      },
      error: (err) => {
        this.carregando = false;
        this.mensagemErro = err?.error?.message || 'Erro ao cadastrar usuário.';
      },
    });
  }

  editarUsuario(usuario: Usuario): void {
    this.isRegister = true;
    this.modoEdicao = true;
    this.usuarioEmEdicaoId = usuario.id;

    this.registerForm.patchValue({
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
      confirmarSenha: usuario.senha,
    });

    this.limparMensagens();
  }

  cancelarEdicao(): void {
    this.modoEdicao = false;
    this.usuarioEmEdicaoId = null;
  }

  excluirUsuario(id: number): void {
    this.limparMensagens();

    this.usuarioService.excluirUsuario(id).subscribe({
      next: () => {
        this.mensagemSucesso = 'Usuário excluído com sucesso!';
        this.carregarUsuarios();
      },
      error: (err) => {
        this.mensagemErro = err?.error?.message || 'Erro ao excluir usuário.';
      },
    });
  }

  entrar(): void {
    this.limparMensagens();

    if (this.loginForm.invalid) {
      this.loginForm.markAllAsTouched();
      return;
    }

    const payload: LoginPayload = {
      email: this.loginForm.value.email,
      senha: this.loginForm.value.senha,
    };

    this.carregando = true;

    this.authService.login(payload).subscribe({
      next: (response) => {
        this.carregando = false;
        this.mensagemSucesso = response.message || 'Login realizado com sucesso!';

        localStorage.setItem('sessao', JSON.stringify(response.usuario));

        this.navigation.irPara('home');
      },
      error: (err) => {
        this.carregando = false;
        this.mensagemErro = err?.error?.message || 'Email ou senha inválidos.';
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
