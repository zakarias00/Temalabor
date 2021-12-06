import { identifierModuleUrl } from '@angular/compiler';
import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddactivityComponent } from '../addactivity/addactivity.component';
import { Activity } from '../services/activity';
import { ActivityService } from '../services/activity.service';
import { Sport } from '../services/sport';
import { SportService } from '../services/sport.service';
import { User } from '../services/user';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-activity',
  templateUrl: './activity.component.html',
  styleUrls: ['./activity.component.css']
})
export class ActivityComponent implements OnInit {

  loggedUser: User;
  allActivities: Activity[] = [];
  allSports: Sport[] = [];
  selectedSport: number;

  constructor(
    private sportService: SportService,
    private activityService: ActivityService,
    private userService: UserService,
    private modalService: NgbModal
    ) {
      this.userService.GetUserById(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
        loggedUser=>{this.loggedUser = loggedUser;});
    }

  ngOnInit(): void {
    this.AllSports();
    this.AllActivities();
  }

  AllSports(){
    this.sportService.GetSports().subscribe(
      (allSports) => {
        (this.allSports = allSports);
      }
    )
  }

  AllActivities(){
    this.activityService.GetActivityByUserId(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
      (allActivities) => {
        (this.allActivities = allActivities);
      }
    );
  }

  onSportTypeSelected(){
    this.activityService.GetActivityBySportId(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}')), this.selectedSport).subscribe(
      (allActivities) => {
        (this.allActivities = allActivities);
      }
    );
  }

  addActivity(user: User){
    const ref = this.modalService.open(AddactivityComponent)
    ref.componentInstance.loggedUser = user;

    ref.result.then((yes)=>{
      console.log("ok click");
      
    },
    (cancel)=>{
      console.log("cancel click");
      
    })

  }

}
