export interface UsuarioCreate {
  nome: string;
  cpf: string;
  email: string;
  senha: string;
  confirmarSenha: string;
}

export interface LoginPayload {
  email: string;
  senha: string;
}

export interface AuthResponse {
  token: string;
}
