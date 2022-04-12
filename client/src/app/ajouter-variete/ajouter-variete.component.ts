import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-ajouter-variete',
  templateUrl: './ajouter-variete.component.html',
  styleUrls: ['./ajouter-variete.component.css']
})
export class AjouterVarieteComponent implements OnInit {

  @ViewChild("nomVariete") nomVariete: ElementRef;
  @ViewChild("descriptionSemis") descriptionSemis: ElementRef;
  @ViewChild("descriptionPlantation") descriptionPlantation: ElementRef;
  @ViewChild("descriptionEntretien") descriptionEntretien: ElementRef;
  @ViewChild("descriptionMiseEnPlace") descriptionMiseEnPlace: ElementRef;
  @ViewChild("descriptionRecolte") descriptionRecolte: ElementRef;
  @ViewChild("commentaireGeneral") commentaireGeneral: ElementRef;
  @ViewChild("descriptionPeriodeRecolte") descriptionPeriodeRecolte: ElementRef;
  @ViewChild("anneeMiseEnMarchee") anneeMiseEnMarchee: ElementRef;

  
  constructor(private communicationService: CommunicationService) { }

  ngOnInit() {
  }

  addVariete(){
    const newVariete ={
      nomVariete: this.nomVariete.nativeElement.innerText,
      descriptionSemis: this.descriptionSemis.nativeElement.innerText,
      descriptionPlantation: this.descriptionPlantation.nativeElement.innerText,
      descriptionEntretien: this.descriptionEntretien.nativeElement.innerText,
      descriptionMiseEnPlace: this.descriptionMiseEnPlace.nativeElement.innerText,
      descriptionRecolte: this.descriptionRecolte.nativeElement.innerText,
      commentaireGeneral: this.commentaireGeneral.nativeElement.innerText,
      descriptionPeriodeRecolte: this.descriptionPeriodeRecolte.nativeElement.innerText,
      anneeMiseEnMarchee: this.anneeMiseEnMarchee.nativeElement.innerText,
    };
    this.communicationService.insertVariete(newVariete).subscribe((res: number) => {
      if (res > 0) {
        this.communicationService.filter("update");
      }
  
    });

    window.location.reload();
  }

}
