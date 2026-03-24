import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CriacaoDeTelas } from './criacao-de-telas';

describe('CriacaoDeTelas', () => {
  let component: CriacaoDeTelas;
  let fixture: ComponentFixture<CriacaoDeTelas>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CriacaoDeTelas]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CriacaoDeTelas);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
