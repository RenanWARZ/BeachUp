import { ComponentFixture, TestBed } from '@angular/core/testing';
import { Telaredirecionamento } from './telaredirecionamento';

describe('Telaredirecionamento', () => {
  let component: Telaredirecionamento;
  let fixture: ComponentFixture<Telaredirecionamento>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Telaredirecionamento]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Telaredirecionamento);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
