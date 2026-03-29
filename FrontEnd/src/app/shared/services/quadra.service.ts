import { Injectable } from '@angular/core';
import { Quadra } from './models/quadra.model';

@Injectable({
  providedIn: 'root',
})
export class QuadraService {
  private readonly STORAGE_KEY = 'quadras_data';

  constructor() {}

  getQuadras(): Quadra[] {
    const data = localStorage.getItem(this.STORAGE_KEY);
    return data ? JSON.parse(data) : [];
  }

  addQuadra(quadra: Quadra): void {
    const quadras = this.getQuadras();
    quadra.id = Date.now(); // Simple ID generation
    quadras.push(quadra);
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(quadras));
  }

  deleteQuadra(id: number): void {
    const quadras = this.getQuadras().filter((q) => q.id !== id);
    localStorage.setItem(this.STORAGE_KEY, JSON.stringify(quadras));
  }
}
