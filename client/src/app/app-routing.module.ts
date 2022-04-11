import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";

import { AppComponent } from "./app.component";
import { HotelComponent } from "./hotel/hotel.component";
import { RoomComponent } from "./room/room.component";
import { GuestComponent } from "./guest/guest.component";
import { JardinComponent } from "./jardin/jardin.component";
import { PlanteComponent } from "./plante/plante.component";
import { VarieteComponent } from "./variete/variete.component";

const routes: Routes = [
  { path: "app", component: AppComponent },
  { path: "rooms", component: RoomComponent },
  { path: "hotels", component: HotelComponent },
  { path: "guests", component: GuestComponent },
  { path: "jardins", component: JardinComponent },
  { path: "plantes", component: PlanteComponent },
  { path: "varietes", component: VarieteComponent },


];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }