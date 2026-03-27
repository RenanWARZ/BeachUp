export interface UsuarioCreate {
  nome: string;
  email: string;
  senha: string;
}

export interface LoginPayload {
  email: string;
  senha: string;
}

export interface AuthResponse {
  token: string;
  usuario: {
    id: number;
    nome: string;
    email: string;
  };
}
