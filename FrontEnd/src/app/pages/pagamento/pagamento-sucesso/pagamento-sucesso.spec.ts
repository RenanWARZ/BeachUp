import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PagamentoSucesso } from './pagamento-sucesso';

describe('PagamentoSucesso', () => {
  let component: PagamentoSucesso;
  let fixture: ComponentFixture<PagamentoSucesso>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PagamentoSucesso]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PagamentoSucesso);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
