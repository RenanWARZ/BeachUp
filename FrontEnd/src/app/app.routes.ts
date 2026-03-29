import { Routes } from '@angular/router';
import { Home } from './pages/home/home';
import { Sobre } from './pages/sobre/sobre';
import { Login } from './pages/login/login';
import { CadastroQuadra } from './pages/cadastro-quadra/cadastro-quadra';
import { Pagamento } from './pages/pagamento/pagamento';
import { Telaredirecionamento } from './pages/telaredirecionamento/telaredirecionamento';
import { Avaliacoes } from './pages/avaliacoes/avaliacoes';
import { TelaReservaQuadras } from './pages/tela-reserva-quadras/tela-reserva-quadras';
import { PagamentoSucesso } from './pages/pagamento/pagamento-sucesso/pagamento-sucesso';

export const routes: Routes = [
  { path: 'pagamento-sucesso', component: PagamentoSucesso },
  { path: 'telaredirecionamento', component: Telaredirecionamento },
  { path: 'telaReservaQuadras', component: TelaReservaQuadras },
  { path: 'avaliacoes', component: Avaliacoes },
  { path: 'pagamento', component: Pagamento },
  { path: 'cadastroQuadra', component: CadastroQuadra },
  { path: '', component: Home },
  { path: 'sobre', component: Sobre },
  { path: 'login', component: Login },
  { path: 'login/cadastrar', component: Login }, // mesma página, mas abre cadastro
  { path: '**', redirectTo: '' },
];
