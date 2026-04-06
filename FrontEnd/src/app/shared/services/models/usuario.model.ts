export interface Usuario {
  message: string;
  id: number;
  nome: string;
  email: string;
  senha: string;
}

export interface UsuarioCreate {
  nome: string;
  email: string;
  senha: string;
}

export interface UsuarioUpdate {
  id: number;
  nome: string;
  email: string;
  senha: string;
}
