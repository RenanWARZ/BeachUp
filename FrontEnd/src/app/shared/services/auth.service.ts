import { Injectable, inject } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { delay } from 'rxjs/operators';
import { UsuarioService } from './usuario.service';
import { LoginPayload, LoginResponse } from './models/auth.model';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
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

  private usuarioService = inject(UsuarioService);

  login(payload: LoginPayload): Observable<LoginResponse> {
    const usuario = this.usuarioService.buscarPorEmail(payload.email);

    if (!usuario || usuario.senha !== payload.senha) {
      return throwError(() => ({
        error: { message: 'Email ou senha inválidos.' },
      }));
    }

    return of({
      message: `Bem-vindo, ${usuario.nome}!`,
      usuario: {
        id: usuario.id,
        nome: usuario.nome,
        email: usuario.email,
      },
    }).pipe(delay(300));
  }
}
