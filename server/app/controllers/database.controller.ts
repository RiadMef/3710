import { NextFunction, Request, Response, Router } from "express";
import { inject, injectable } from "inversify";
import * as pg from "pg";


import { DatabaseService } from "../services/database.service";
import Types from "../types";

@injectable()
export class DatabaseController {
  public constructor(
    @inject(Types.DatabaseService) private databaseService: DatabaseService
  ) {}

  public get router(): Router {
    const router: Router = Router();

   
    router.get("/jardins", (req: Request, res: Response, _: NextFunction) => {
      
      this.databaseService
        .filterJardins()
        .then((result: pg.QueryResult) => {
          const jardins: any[] = result.rows.map((jardin: any) => ({
            identifiantJardin: jardin.identifiantjardin,
            nomJardin: jardin.nomjardin,
            surface: jardin.surface,
            hauteurMaximale:jardin.hauteurmaximale,
            potagerJardinFlag:jardin.potagerjardinflag,
            ornementJardinFlag:jardin.ornementjardinflag,
            vergerJardinFlag:jardin.vergerjardinflag,
            typeSol:jardin.typesol
          }));
          res.json(jardins);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });

    router.get("/jardins/:id", (req: Request, res: Response, _: NextFunction) => {
     
      const varieteId: string = req.params.id;
      let jardins:any =[];

      this.databaseService
        .filterJardin(varieteId)
        .then((result: pg.QueryResult) => {
          jardins.push(result[0].rows);
          jardins.push(result[1].rows);
          jardins.push(result[2].rows);
          jardins.push(result[3].rows);
          res.json(jardins);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });


    router.get("/plantes", (req: Request, res: Response, _: NextFunction) => {
      
      this.databaseService
        .filtrerPlantes()
        .then((result: pg.QueryResult) => {
          const plantes: any[] = result.rows.map((plante: any) => ({
            identifiantJardin: plante.identifiantjardin,
            nomPlante: plante.nomplante,
            nomVariete: plante.nomvariete,
            categoriePlante:plante.categorieplante,
            typePlante:plante.typeplante,
            sousTypePlante:plante.soustypeplante,
            nomLatinPlante:plante.nomlatinplante,
          }));
          res.json(plantes);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });
    router.get("/varietes", (req: Request, res: Response, _: NextFunction) => {
      
      this.databaseService
        .filtrerVarietes()
        .then((result: pg.QueryResult) => {
          const varites: any[] = result.rows.map((variete: any) => ({
            nomVariete: variete.nomvariete,
            descriptionSemis: variete.descriptionsemis,
            descriptionPlantation: variete.descriptionplantation,
            descriptionEntretien:variete.descriptionentretien,
            descriptionMiseEnPlace:variete.descriptionmiseenplace,
            descriptionRecolte:variete.descriptionrecolte,
            commentaireGeneral:variete.commentairegeneral,
            descriptionPeriodeRecolte:variete.descriptionperioderecolte,
            anneeMiseEnMarchee:variete.anneemiseenmarchee,
          }));
          res.json(varites);
        })
        .catch((e: Error) => {
          console.error(e.stack);
        });
    });

    
  

    router.post(
      "/variete/insert",
      (req: Request, res: Response, _: NextFunction) => {
        

        const Variete:any ={
          nomvariete: req.body.nomVariete,
          descriptionsemis: req.body.descriptionSemis ,
          descriptionplantation: req.body.descriptionPlantation,
          descriptionentretien: req.body.descriptionEntretien,
          descriptionmiseenplace: req.body.descriptionMiseEnPlace,
          descriptionrecolte: req.body.descriptionRecolte,
          commentairegeneral: req.body.commentaireGeneral,
          descriptionperioderecolte: req.body.descriptionPeriodeRecolte,
          anneemiseenmarchee: req.body.anneeMiseEnMarchee,
        };
        this.databaseService
          .createVariete(Variete)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
            res.json(-1);
          });
      }
    );
    

    router.delete(
      "/variete/delete/:nomVariete",
      (req: Request, res: Response, _: NextFunction) => {
        console.log( req.params.nomVariete);
        const nomVariete: string = req.params.nomVariete;
        this.databaseService
          .deleteVariete(nomVariete)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
          });
      }
    );


    
    router.put(
      "/variete/update",
      (req: Request, res: Response, _: NextFunction) => {
        const variete: any = {
          nomvariete: req.body.nomVariete,
          descriptionsemis: req.body.descriptionSemis ,
          descriptionplantation: req.body.descriptionPlantation,
          descriptionentretien: req.body.descriptionEntretien,
          descriptionmiseenplace: req.body.descriptionMiseEnPlace,
          descriptionrecolte: req.body.descriptionRecolte,
          commentairegeneral: req.body.commentaireGeneral,
          descriptionperioderecolte: req.body.descriptionPeriodeRecolte,
          anneemiseenmarchee: req.body.anneeMiseEnMarchee,
        };

        this.databaseService
          .updateVariete(variete)
          .then((result: pg.QueryResult) => {
            res.json(result.rowCount);
          })
          .catch((e: Error) => {
            console.error(e.stack);
          });
      }
    );

   

    

    return router;
  }
}
