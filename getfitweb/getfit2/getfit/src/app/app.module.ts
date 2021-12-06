import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { PersonaldataComponent } from './personaldata/personaldata.component';
import { ActivityComponent } from './activity/activity.component';
import { LeaderboardComponent } from './leaderboard/leaderboard.component';
import { ProfileComponent } from './profile/profile.component';
import { ProgressComponent } from './progress/progress.component';
import { UserService } from './services/user.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { EditprofileComponent } from './editprofile/editprofile.component';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatInputModule } from '@angular/material/input';
import { MatNativeDateModule } from '@angular/material/core';
import { SportService } from './services/sport.service';
import { ActivityService } from './services/activity.service';
import { GoalService } from './services/goal.service';
import { AddactivityComponent } from './addactivity/addactivity.component';
import { AddgoalComponent } from './addgoal/addgoal.component';
import { SportsComponent } from './sports/sports.component';
import { AddsportComponent } from './addsport/addsport.component';
import { ProgressBarModule } from 'angular-progress-bar';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    PersonaldataComponent,
    ActivityComponent,
    LeaderboardComponent,
    ProfileComponent,
    ProgressComponent,
    EditprofileComponent,
    AddactivityComponent,
    AddgoalComponent,
    SportsComponent,
    AddsportComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule,
    ToastrModule.forRoot(),
    BrowserAnimationsModule,
    NgbModule,
    MatDatepickerModule,
    MatInputModule,
    MatNativeDateModule,
    ProgressBarModule
  ],
  providers: [
    UserService,
    SportService,
    ActivityService,
    GoalService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
