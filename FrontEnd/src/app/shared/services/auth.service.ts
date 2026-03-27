import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { UsuarioCreate, LoginPayload, AuthResponse } from './models/auth.model';

@Injectable({
  providedIn: 'root',
})

export class AuthService {
  private http = inject(HttpClient);

  private apiUrl = 'http://localhost:8080/auth';

  criarConta(payload: UsuarioCreate): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/register`, payload);
  }

  login(payload: LoginPayload): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/login`, payload);
  }
}
