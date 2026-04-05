import { Injectable } from '@angular/core';
import { Quadra } from './models/quadra.model';

@Injectable({
  providedIn: 'root',
})
export class QuadraService {
  private quadras: Quadra[] = []; 

  constructor() {}

  getQuadras(): Quadra[] {
    return this.quadras;
  }

  addQuadra(quadra: Quadra): void {

    quadra.id = Date.now();
    this.quadras.push(quadra);
  }

  deleteQuadra(id: number): void {
    this.quadras = this.quadras.filter((q) => q.id !== id);
  }
}
