import { Component, OnInit } from '@angular/core';
import { CommunicationService } from '../communication.service';

@Component({
  selector: 'app-variete',
  templateUrl: './variete.component.html',
  styleUrls: ['./variete.component.css']
})
export class VarieteComponent implements OnInit {

  public varietes: any[] = [];

  public constructor(private communicationService: CommunicationService) {}

  public ngOnInit(): void {
    this.getVarietes();
  }

  public getVarietes(): void {
    this.communicationService.getVarietes().subscribe((varietes: any[]) => {
      
  
      this.varietes = varietes;
    
  });
 
  }

}
