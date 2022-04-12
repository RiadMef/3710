import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { JardinSelectionComponent } from './jardin-selection.component';

describe('JardinSelectionComponent', () => {
  let component: JardinSelectionComponent;
  let fixture: ComponentFixture<JardinSelectionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ JardinSelectionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(JardinSelectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
