import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroQuadra } from './cadastro-quadra';

describe('CadastroQuadra', () => {
  let component: CadastroQuadra;
  let fixture: ComponentFixture<CadastroQuadra>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CadastroQuadra]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroQuadra);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
