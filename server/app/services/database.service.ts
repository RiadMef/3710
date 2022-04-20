import { injectable } from "inversify";
import * as pg from "pg";
import "reflect-metadata";


@injectable()
export class DatabaseService {

  // TODO: A MODIFIER POUR VOTRE BD
  public connectionConfig: pg.ConnectionConfig = {
    user: "postgres",
    database: "jardindb",
    password: "0000",
    port: 5432,
    host: "127.0.0.1",
    keepAlive: true
  };

  public pool: pg.Pool = new pg.Pool(this.connectionConfig);

  

  public async createVariete(variete: any): Promise<pg.QueryResult> {
    
    const client = await this.pool.connect();
    const values: string[] = [];
    if (variete.nomvariete.length > 0) values.push(variete.nomvariete);
    if (variete.descriptionsemis.length > 0) values.push(variete.descriptionsemis);
    if (variete.descriptionplantation.length > 0) values.push(variete.descriptionplantation);
    if (variete.descriptionentretien.length > 0) values.push(variete.descriptionentretien);
    if (variete.descriptionmiseenplace.length > 0) values.push(variete.descriptionmiseenplace);
    if (variete.descriptionrecolte.length > 0) values.push(variete.descriptionrecolte);
    if (variete.commentairegeneral.length > 0) values.push(variete.commentairegeneral);
    if (variete.descriptionperioderecolte.length > 0) values.push(variete.descriptionperioderecolte);
    if (variete.anneemiseenmarchee.length > 0) values.push(variete.anneemiseenmarchee);

   
    const queryText: string = `INSERT INTO BDSCHEMA.Variete VALUES($1, $2, $3,$4, $5, $6,$7, $8, $9 );`;

    const res = await client.query(queryText, values);
    client.release()
    return res;
  }



  public async filterJardins(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();

    const searchTerms: string[] = [];
    
    let queryText = "SELECT * FROM BDSCHEMA.Jardin";
    if (searchTerms.length > 0) queryText += " WHERE " + searchTerms.join(" AND ");
    queryText += ";";

    const res = await client.query(queryText);
    client.release()
    return res;
  }

  public async filterJardin(primaryKey:string): Promise<pg.QueryResult> {
    const client = await this.pool.connect();
    let rep: any= [];
   
    let jardinReq = "SELECT * FROM BDSCHEMA.Jardin WHERE " +`identifiantJardin = '${primaryKey}'`;
    let parcelleReq = "SELECT * FROM BDSCHEMA.Parcelle WHERE " +`identifiantJardin = '${primaryKey}'`;
    let rangReq = "SELECT * FROM BDSCHEMA.Rang WHERE parcelleID IN (SELECT parcelleID FROM BDSCHEMA.Parcelle WHERE " +`identifiantJardin = '${primaryKey}'` + ")";
    let varieteReq = "SELECT * FROM BDSCHEMA.Variete WHERE nomVariete IN (SELECT nomVariete FROM BDSCHEMA.RangVariete WHERE parcelleID IN (SELECT parcelleID FROM BDSCHEMA.Parcelle WHERE "+`identifiantJardin = '${primaryKey}'` + "))";
    let jardin = await client.query(jardinReq);
    let parcelle = await client.query(parcelleReq);
    let rang = await client.query(rangReq);
    let variete = await client.query(varieteReq);
    rep.push(jardin );
    rep.push(parcelle);
    rep.push(rang);
    rep.push(variete);

    client.release()
    return rep;
  }

  public async filtrerPlantes(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();

    const searchTerms: string[] = [];
    
    let queryText = "SELECT * FROM BDSCHEMA.Plante";
    if (searchTerms.length > 0) queryText += " WHERE " + searchTerms.join(" AND ");
    queryText += ";";

    const res = await client.query(queryText);
    client.release()
    return res;
  }
  public async filtrerVarietes(): Promise<pg.QueryResult> {
    const client = await this.pool.connect();

    const searchTerms: string[] = [];
    
    let queryText = "SELECT * FROM BDSCHEMA.Variete";
    if (searchTerms.length > 0) queryText += " WHERE " + searchTerms.join(" AND ");
    queryText += ";";

    const res = await client.query(queryText);
    client.release()
    return res;
  }
 

  public async updateVariete(variete: any): Promise<pg.QueryResult> {
    const client = await this.pool.connect();

    let toUpdateValues = [];
  
    if (variete.nomvariete.length > 0) toUpdateValues.push(`nomvariete = '${variete.nomvariete}'`);
    if (variete.descriptionsemis.length > 0) toUpdateValues.push(`descriptionsemis = '${variete.descriptionsemis}'`);
    if (variete.descriptionplantation.length > 0) toUpdateValues.push(`descriptionplantation = '${variete.descriptionplantation}'`);
    if (variete.descriptionentretien.length > 0) toUpdateValues.push(`descriptionentretien = '${variete.descriptionentretien}'`);
    if (variete.descriptionmiseenplace.length > 0) toUpdateValues.push(`descriptionmiseenplace = '${variete.descriptionmiseenplace}'`);
    if (variete.descriptionrecolte.length > 0) toUpdateValues.push(`descriptionrecolte = '${variete.descriptionrecolte}'`);
    if (variete.commentairegeneral.length > 0) toUpdateValues.push(`commentairegeneral = '${variete.commentairegeneral}'`);
    if (variete.descriptionperioderecolte.length > 0) toUpdateValues.push(`descriptionperioderecolte = '${variete.descriptionperioderecolte}'`);
    if (variete.anneemiseenmarchee.length > 0) toUpdateValues.push(`anneemiseenmarchee = '${variete.anneemiseenmarchee}'`);
    const query = `UPDATE BDSCHEMA.Variete SET ${toUpdateValues.join(", ")} WHERE nomvariete = '${variete.nomvariete}';`;
    const res = await client.query(query);
    client.release()
    return res;
  }



  public async deleteVariete(nomVariete: string): Promise<pg.QueryResult> {
    if (nomVariete.length === 0) throw new Error("Invalid delete query");
    
    
    const client = await this.pool.connect();
    console.log(nomVariete);
    const query = `DELETE FROM BDSCHEMA.Variete WHERE nomvariete = '${nomVariete}';`;
   
    const res = await client.query(query);
    client.release()
    return res;
  }

}
