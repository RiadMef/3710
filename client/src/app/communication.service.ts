import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
// tslint:disable-next-line:ordered-imports
import { of, Observable, Subject } from "rxjs";
import { catchError } from "rxjs/operators";
@Injectable()
export class CommunicationService {
  private readonly BASE_URL: string = "http://localhost:3000/database";
  public constructor(private http: HttpClient) {}

  private _listners: any = new Subject<any>();

  public listen(): Observable<any> {
    return this._listners.asObservable();
  }

  public filter(filterBy: string): void {
    this._listners.next(filterBy);
  }
  public getVarietes(): Observable<any[]> {
    return this.http
      .get<any[]>(this.BASE_URL + "/varietes")
      .pipe(catchError(this.handleError<any[]>("getVarietes")));
  }
 
  public getJardins(): Observable<any[]> {
    return this.http
      .get<any[]>(this.BASE_URL + "/jardins")
      .pipe(catchError(this.handleError<any[]>("getjardins")));
  }

  public getJardin(primaryKey:string): Observable<any[]> {
    return this.http
      .get<any[]>(this.BASE_URL + "/jardins/"+primaryKey)
      .pipe(catchError(this.handleError<any[]>("getJardin")));
  }

  public getPlantes(): Observable<any[]> {
    return this.http
      .get<any[]>(this.BASE_URL + "/plantes")
      .pipe(catchError(this.handleError<any[]>("getPlantes")));
  }
 

  public insertVariete(variete: any): Observable<any> {
    return this.http
      .post<any>(this.BASE_URL + "/variete/insert", variete)
      .pipe(catchError(this.handleError<any>("insertVariete")));
  }

  

  public updateVariete(variete: any): Observable<any> {
    return this.http
      .put<any>(this.BASE_URL + "/variete/update", variete)
      .pipe(catchError(this.handleError<any>("updateVariete")));
  }



  public deleteVariete(nomVariete: string): Observable<number> {
    return this.http
      .delete<any>(this.BASE_URL + "/variete/delete/" + nomVariete, {})
      .pipe(catchError(this.handleError<any>("deleteHotel")));
  }



  private handleError<T>(
    request: string,
    result?: T
  ): (error: Error) => Observable<T> {
    return (error: Error): Observable<T> => {
      return of(result as T);
    };
  }
}
