import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ActivityComponent } from './activity/activity.component';
import { LeaderboardComponent } from './leaderboard/leaderboard.component';
import { LoginComponent } from './login/login.component';
import { PersonaldataComponent } from './personaldata/personaldata.component';
import { ProfileComponent } from './profile/profile.component';
import { ProgressComponent } from './progress/progress.component';
import { SportsComponent } from './sports/sports.component';

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  {path: 'personaldata', component: PersonaldataComponent},
  {path: 'leaderboard', component: LeaderboardComponent},
  {path: 'activity', component: ActivityComponent},
  {path: 'progress', component: ProgressComponent},
  {path: 'profile', component: ProfileComponent},
  {path: 'sports', component: SportsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
