import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TelaReservaQuadras } from './tela-reserva-quadras';

describe('TelaReservaQuadras', () => {
  let component: TelaReservaQuadras;
  let fixture: ComponentFixture<TelaReservaQuadras>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TelaReservaQuadras]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TelaReservaQuadras);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
