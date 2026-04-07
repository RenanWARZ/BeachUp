import { ComponentFixture, TestBed } from '@angular/core/testing';
import { TelaReservaQuadras } from './tela-reserva-quadras';

describe('TelaReservaQuadras', () => {
  let component: TelaReservaQuadras;
  let fixture: ComponentFixture<TelaReservaQuadras>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TelaReservaQuadras],
    }).compileComponents();

    fixture = TestBed.createComponent(TelaReservaQuadras);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('deve criar o componente', () => {
    expect(component).toBeTruthy();
  });

  it('deve criar uma reserva', () => {
    component.quadraSelecionada = 1;
    component.dataSelecionada = '2026-04-10';
    component.horaInicio = '10:00';
    component.horaFim = '11:00';
    component.reservar();
    expect(component.reservas.length).toBe(1);
    expect(component.reservas[0].quadraNome).toBe('Quadra 1');
    expect(component.reservas[0].preco).toBe(160);
  });

  it('deve editar uma reserva', () => {
    component.quadraSelecionada = 3;
    component.dataSelecionada = '2026-04-10';
    component.horaInicio = '08:00';
    component.horaFim = '09:00';
    component.reservar();
    expect(component.reservas.length).toBe(1);

    // Clica em editar
    component.editarReserva(component.reservas[0]);
    expect(component.editandoId).toBe(component.reservas[0].id);

    // Muda quadra e horário
    component.quadraSelecionada = 5;
    component.horaFim = '10:00';
    component.reservar();

    // Deve ter atualizado, não duplicado
    expect(component.reservas.length).toBe(1);
    expect(component.reservas[0].quadraNome).toBe('Quadra 5');
    expect(component.reservas[0].horaFim).toBe('10:00');
    expect(component.editandoId).toBeNull();
  });

  it('deve cancelar a edição', () => {
    component.quadraSelecionada = 1;
    component.dataSelecionada = '2026-04-10';
    component.horaInicio = '08:00';
    component.horaFim = '09:00';
    component.reservar();

    component.editarReserva(component.reservas[0]);
    expect(component.editandoId).not.toBeNull();

    component.cancelarEdicao();
    expect(component.editandoId).toBeNull();
    expect(component.quadraSelecionada).toBeNull();
  });

  it('deve excluir uma reserva com confirmação', () => {
    component.quadraSelecionada = 2;
    component.dataSelecionada = '2026-04-10';
    component.horaInicio = '14:00';
    component.horaFim = '15:00';
    component.reservar();
    expect(component.reservas.length).toBe(1);

    // Abre dialog de exclusão
    component.abrirDialogExclusao(component.reservas[0]);
    expect(component.mostrarDialogExclusao).toBeTrue();

    // Confirma
    component.confirmarExclusao();
    expect(component.reservas.length).toBe(0);
    expect(component.mostrarDialogExclusao).toBeFalse();
  });

  it('deve cancelar a exclusão', () => {
    component.quadraSelecionada = 4;
    component.dataSelecionada = '2026-04-10';
    component.horaInicio = '16:00';
    component.horaFim = '17:00';
    component.reservar();

    component.abrirDialogExclusao(component.reservas[0]);
    component.cancelarExclusao();

    expect(component.reservas.length).toBe(1);
    expect(component.mostrarDialogExclusao).toBeFalse();
  });
});
