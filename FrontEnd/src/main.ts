import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { App } from './app/app';
import { LOCALE_ID } from '@angular/core';
import localePt from '@angular/common/locales/pt';
import { registerLocaleData } from '@angular/common';

registerLocaleData(localePt);

bootstrapApplication(App, {
  ...appConfig,
  providers: [...(appConfig.providers || []), { provide: LOCALE_ID, useValue: 'pt-BR' }],
}).catch((err) => console.error(err));
