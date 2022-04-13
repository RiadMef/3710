import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-jardin-selection',
  templateUrl: './jardin-selection.component.html',
  styleUrls: ['./jardin-selection.component.css']
})
export class JardinSelectionComponent implements OnInit {
  primaryKey: string ='';
  jardin:any=[];
  constructor(private route: ActivatedRoute,private communicationService: CommunicationService) { 
    this.route.params.subscribe(params => {
    
      this.primaryKey = params['id'];
     
    });
  }

  ngOnInit() {
    
    this.getJardin();
  }

  getJardin(){
    this.communicationService.getJardin(this.primaryKey).subscribe((jardin: any) => {
      jardin[0].forEach((jardin: any) => {
        if (jardin.potagerjardinflag) {
          jardin.potagerjardinflag = "potager";
        } else {
          jardin.potagerjardinflag = "";
        }
        if (jardin.ornementjardinflag) {
          jardin.ornementjardinflag = "ornement";
        } else {
          jardin.ornementjardinflag = "";
        }
        if (jardin.vergerjardinflag) {
          jardin.vergerjardinflag = "verger";
        } else {
          jardin.vergerjardinflag = "";
        }
        if (jardin.hauteurmaximale === null) {
          jardin.hauteurmaximale = "non spécifié";
        }
        if (jardin.typesol === null) {
          jardin.typesol = "non spécifié";
        }
        
      });
      console.log(jardin);
      this.jardin = jardin;
    });
  }
  

}
