import { ComponentFixture, TestBed } from '@angular/core/testing';
import { Pagamento } from './pagamento';
import { NavigationService } from '../../shared/services/navigation';
import { ReactiveFormsModule } from '@angular/forms';


describe('Pagamento', () => {
  let component: Pagamento;
  let fixture: ComponentFixture<Pagamento>;

var jasmine: any;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Pagamento, ReactiveFormsModule], // 👈 AQUI
      providers: [
        {
          provide: NavigationService,
          useValue: {
            irPara: jasmine.createSpy('irPara'),
            getDados: jasmine.createSpy('getDados').and.returnValue({}),
          },
        },
      ],
    }).compileComponents();

    fixture = TestBed.createComponent(Pagamento);
    component = fixture.componentInstance;
    fixture.detectChanges(); // 👈 AQUI
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
