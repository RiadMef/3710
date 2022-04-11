import { CommonModule } from "@angular/common";
import { HttpClientModule } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./app-routing.module";
import { AppComponent } from "./app.component";
import { CommunicationService } from "./communication.service";
import { GuestComponent } from "./guest/guest.component";
import { HotelComponent } from "./hotel/hotel.component";
import { RoomComponent } from "./room/room.component";
import { JardinComponent } from './jardin/jardin.component';
import { PlanteComponent } from './plante/plante.component';
import { PlanteFilterPipe } from './plante-filter.pipe';
import { VarieteComponent } from './variete/variete.component';

@NgModule({
  declarations: [
    AppComponent,
    RoomComponent,
    HotelComponent,
    GuestComponent,
    JardinComponent,
    PlanteComponent,
    PlanteFilterPipe,
    VarieteComponent,
  ],
  imports: [
    CommonModule,
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
  ],
  providers: [CommunicationService],
  bootstrap: [AppComponent],
})
export class AppModule { }
