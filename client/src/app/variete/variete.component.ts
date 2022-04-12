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
private refresh() {
  this.getVarietes();
}
public changeVariete(event: any, proprety:string ,i:number){
  const editField = event.target.textContent;
  this.varietes[i][proprety] = editField;
}


  public deleteVariete(nomVariete: string) {
    this.communicationService.deleteVariete(nomVariete).subscribe((res: any) => {
      this.refresh();
    });
  }

  public updateVariete(i: number) {
    this.communicationService.updateVariete(this.varietes[i]).subscribe((res: any) => {
      this.refresh();
    });
  }

}
