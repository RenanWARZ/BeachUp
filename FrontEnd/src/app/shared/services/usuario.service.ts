import { Injectable } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { LoginPayload } from '../../shared/services/models/auth.model';
import { Usuario, UsuarioCreate, UsuarioUpdate } from '../../shared/services/models/usuario.model';

@Injectable({
  providedIn: 'root',
})
export class UsuarioService {
  private readonly STORAGE_KEY = 'usuarios';

  private obterUsuarios(): Usuario[] {
    const dados = localStorage.getItem(this.STORAGE_KEY);
    return dados ? JSON.parse(dados) : [];
  }

  private salvarUsuarios(usuarios: Usuario[]): void {
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(usuarios));
  }

  listarUsuarios(): Observable<Usuario[]> {
    return of(this.obterUsuarios());
  }

  criarUsuario(payload: UsuarioCreate): Observable<Usuario> {
    const usuarios = this.obterUsuarios();

    const emailJaExiste = usuarios.some(
      (u) => u.email.toLowerCase() === payload.email.toLowerCase(),
    );

    if (emailJaExiste) {
      return throwError(() => ({
        error: { message: 'Este email já está cadastrado.' },
      }));
    }

    const novoUsuario: Usuario = {
      id: usuarios.length ? Math.max(...usuarios.map((u) => u.id)) + 1 : 1,
      nome: payload.nome,
      email: payload.email,
      senha: payload.senha,
      message: 'Usuário criado com sucesso!',
    };

    usuarios.push(novoUsuario);
    this.salvarUsuarios(usuarios);

    return of(novoUsuario);
  }

  atualizarUsuario(payload: UsuarioUpdate): Observable<Usuario> {
    const usuarios = this.obterUsuarios();

    const index = usuarios.findIndex((u) => u.id === payload.id);

    if (index === -1) {
      return throwError(() => ({
        error: { message: 'Usuário não encontrado.' },
      }));
    }

    usuarios[index] = {
      id: payload.id,
      nome: payload.nome,
      email: payload.email,
      senha: payload.senha,
      message: 'Usuário atualizado com sucesso!',
    };

    this.salvarUsuarios(usuarios);

    return of(usuarios[index]);
  }

  excluirUsuario(id: number): Observable<number> {
    const usuarios = this.obterUsuarios();
    const novaLista = usuarios.filter((u) => u.id !== id);
    this.salvarUsuarios(novaLista);

    return of(id);
  }

  buscarPorEmail(email: string): Usuario | undefined {
    return this.obterUsuarios().find((u) => u.email.toLowerCase() === email.toLowerCase());
  }
}
