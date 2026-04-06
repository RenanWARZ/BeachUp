export interface LoginPayload {
  email: string;
  senha: string;
}

export interface LoginResponse {
  message: string;
  usuario: {
    id: number;
    nome: string;
    email: string;
  };
}
