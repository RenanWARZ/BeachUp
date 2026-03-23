import { Routes } from '@angular/router';
import { Home } from './pages/home/home';
import { Sobre } from './pages/sobre/sobre';
import { Login } from './pages/login/login';
import { CadastroQuadra } from './pages/cadastro-quadra/cadastro-quadra';
import { Pagamento } from './pages/pagamento/pagamento';
import { Telaredirecionamento } from './pages/telaredirecionamento/telaredirecionamento';

export const routes: Routes = [
  { path: 'Telaredirecionamento', component: Telaredirecionamento },
  { path: 'pagamento', component: Pagamento },
  { path: 'cadastroQuadra', component: CadastroQuadra },
  { path: '', component: Home },
  { path: 'sobre', component: Sobre },
  { path: 'login', component: Login },
  { path: 'login/cadastrar', redirectTo: '' },
  { path: '**', redirectTo: '' },
];
