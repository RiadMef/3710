import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '../communication.service';


@Component({
  selector: 'app-plante',
  templateUrl: './plante.component.html',
  styleUrls: ['./plante.component.css']
})
export class PlanteComponent implements OnInit {
  searchText:string ='';
  public plantes: any[] = [];

  public constructor(private communicationService: CommunicationService) {}

  public ngOnInit(): void {
    this.getPlantes();
  }

  public getPlantes(): void {
    this.communicationService.getPlantes().subscribe((plantes: any[]) => {
      plantes.forEach((plante: any) => {
        if (plante.sousTypePlante === null) {
          plante.sousTypePlante = "pas spécifié";
        }
      });
      this.plantes = plantes;
    });
    
  
  }

}
