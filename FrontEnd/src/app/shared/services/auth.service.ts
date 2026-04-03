import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { delay, Observable, of, throwError } from 'rxjs';
import { UsuarioCreate, LoginPayload, AuthResponse } from './models/auth.model';

@Injectable({
  providedIn: 'root',
})

// export class AuthService {
//   private http = inject(HttpClient);

//   private apiUrl = 'http://localhost:8080/auth';

//   criarConta(payload: UsuarioCreate): Observable<AuthResponse> {
//     return this.http.post<AuthResponse>(`${this.apiUrl}/register`, payload);
//   }

//   login(payload: LoginPayload): Observable<AuthResponse> {
//     return this.http.post<AuthResponse>(`${this.apiUrl}/login`, payload);
//   }
// }

export class AuthService {
  usuarioDados: { nome: string; email: string; senha: string; } | null = null;

  criarConta(dados: { nome: string; email: string; senha: string }): Observable<any> {
    console.log('Cadastro recebido no service:', dados);

     this.usuarioDados = dados;

    return of({
      message: 'Conta criada com sucesso',
      usuario: {
        id: 1,
        nome: dados.nome,
        email: dados.email,
      },
    }).pipe(delay(1000));
  }

  login(dados: { email: string; senha: string }): Observable<any> {
    console.log('Mock login recebido no service:', dados);

    if (this.usuarioDados && dados.email === this.usuarioDados.email || dados.senha === this.usuarioDados?.senha) {
      return of({
        message: 'Login realizado com sucesso',
        token: 'mock-token-123',
        usuario: {
          id: 1,
          nome: 'Usuário Teste',
          email: dados.email,
        },
      }).pipe(delay(1000));
    }

    return throwError(() => ({
      error: { message: 'Email ou senha inválidos.' },
    }));
  }

}
