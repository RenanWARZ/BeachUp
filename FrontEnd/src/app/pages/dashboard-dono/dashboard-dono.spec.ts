import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardDono } from './dashboard-dono';

describe('DashboardDono', () => {
  let component: DashboardDono;
  let fixture: ComponentFixture<DashboardDono>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardDono]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DashboardDono);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
