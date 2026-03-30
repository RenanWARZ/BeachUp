export interface Jogador {
  nome: string;
}

export interface Convite {
  id?: number;
  anfitriao: string;
  jogadores: Jogador[];
  dataConvite: string;
  linkWhatsapp?: string;
}
