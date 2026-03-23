import { Component, OnInit } from '@angular/core';
import { NavigationService } from '../../shared/services/navigation';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, RouterModule } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, CommonModule, RouterModule],
  templateUrl: './login.html',
  styleUrls: ['./login.css'],
})
export class Login implements OnInit {
  isRegister = false;

  nome = '';
  senha = '';
  email = '';
  mostrarSenha = false;
  confirmarSenha = '';

  fecharAlerta = true;

  constructor(
    public navigation: NavigationService,
    private route: ActivatedRoute,
  ) {}

  /*Rotas para cadastrar */
  ngOnInit(): void {
    this.route.url.subscribe((url) => {
      this.isRegister = url.some((segment) => segment.path === 'cadastrar');
    });
  }

  toggle() {
    this.isRegister = !this.isRegister;

    this.nome = '';
    this.email = '';
    this.senha = '';
    this.confirmarSenha = '';
  }

  irPara(rota: string) {
    this.navigation.irPara(rota);
  }

  submit() {
    if (this.confirmarSenha != this.senha) {
      console.log('Senhas não são iguais!');
    } else {
      console.log('Senhas Corretas!');
    }

    console.log('Nome: ', this.nome);
    console.log('Email: ', this.email);
    console.log('Senha: ', this.senha);
    console.log('Confirmar Senha: ', this.confirmarSenha);
  }

  toggleSenha() {
    if (this.senha && this.senha.length > 0) {
      this.mostrarSenha = !this.mostrarSenha;
    }
  }

  alerta() {
    this.fecharAlerta = false;
    this.confirmarSenha = this.senha;
  }

  login() {
    console.log('Email: ', this.email);
    console.log('Senha: ', this.senha);
  }
}
