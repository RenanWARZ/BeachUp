import { Routes } from '@angular/router';
import { Home } from './pages/home/home';
import { Sobre } from './pages/sobre/sobre';
import { Login } from './pages/login/login';

export const routes: Routes = [
  { path: '', component: Home },
  { path: 'sobre', component: Sobre },
  { path: 'login', component: Login },
  { path: '**', redirectTo: '' },
  {path: 'login/cadastrar', redirectTo: ''},
];

