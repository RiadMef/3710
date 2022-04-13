import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-jardin',
  templateUrl: './jardin.component.html',
  styleUrls: ['./jardin.component.css']
})
export class JardinComponent implements OnInit {

  public jardins: any[] = [];
  public duplicateError: boolean = false;

  public constructor(private communicationService: CommunicationService) {}

  public ngOnInit(): void {
    this.getJardins();
  }

  public getJardins(): void {
    this.communicationService.getJardins().subscribe((jardins: any[]) => {
      jardins.forEach((jardin: any) => {
        if (jardin.potagerJardinFlag) {
          jardin.potagerJardinFlag = "potager";
        } else {
          jardin.potagerJardinFlag = "";
        }
        if (jardin.ornementJardinFlag) {
          jardin.ornementJardinFlag = "ornement";
        } else {
          jardin.ornementJardinFlag = "";
        }
        if (jardin.vergerJardinFlag) {
          jardin.vergerJardinFlag = "verger";
        } else {
          jardin.vergerJardinFlag = "";
        }
        if (jardin.hauteurMaximale === null) {
          jardin.hauteurMaximale = "non spécifié";
        }
        if (jardin.typeSol === null) {
          jardin.typeSol = "non spécifié";
        }
        
      });

     
      this.jardins = jardins;
    });

      
  
  }
  
}
