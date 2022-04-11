import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'planteFilter'
})
export class PlanteFilterPipe implements PipeTransform {

  transform(plantes: any[], searchText: string) {
  
    //loop through the array of plantes and return the plantes that match the searchText parameter
    if(!plantes) return [];
    if(!searchText) return plantes;

    searchText = searchText.toLowerCase();

    
    let updatedPlantes = [];

    for(let plante of plantes){
      for(let i=0 ; i< searchText.length ; i++){
        if(plante.nomPlante.toLowerCase()[i] !== searchText[i]){
          break;
        }
        if(i === searchText.length-1){
          updatedPlantes.push(plante);
        }
      }
    }
    return updatedPlantes;
  }

}
