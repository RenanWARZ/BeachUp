import { ApplicationConfig,  provideBrowserGlobalErrorListeners,  provideZoneChangeDetection} from '@angular/core';
import { provideRouter, RouterModule } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';

import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes),
    provideHttpClient(),
  ],
};

RouterModule.forRoot(routes, {
  onSameUrlNavigation: 'reload',
});
