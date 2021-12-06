import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddgoalComponent } from '../addgoal/addgoal.component';
import { Goal } from '../services/goal';
import { GoalService } from '../services/goal.service';
import { User } from '../services/user';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-progress',
  templateUrl: './progress.component.html',
  styleUrls: ['./progress.component.css']
})
export class ProgressComponent implements OnInit {

  minDate = new Date(2020,0,1);
  maxDate = new Date();

  selectedDate: Date;
  selectedTimestamp: number;

  loggedUser: User;
  goal: Goal[] = [];
  displayedGoal: Goal;

  done: number;
  total: number;

  constructor(
    private goalService: GoalService,
    private userService: UserService,
    private modalService: NgbModal
    )
    {
      this.userService.GetUserById(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
        loggedUser=>{this.loggedUser = loggedUser;}
      )

      this.goalService.GetGoalForAWeek(new Date().getTime(), parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
        goal=>{this.goal = goal;}
      )

    }

  ngOnInit(): void {
    
    
  }

  ShowGoal(){
    console.log(this.selectedDate.getTime());

    this.goalService.GetGoalForAWeek(this.selectedDate.getTime(), parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
      goal=>{
        (this.goal = goal);
        console.log(this.goal.length);
        this.displayedGoal = this.goal[0];
        this.done = this.displayedGoal.currentAmount;
        this.total = this.displayedGoal.amount;
      }
    );

  }

  addGoal(user: User){
    const ref = this.modalService.open(AddgoalComponent)
    ref.componentInstance.loggedUser = user;

    ref.result.then((yes)=>{
      console.log("ok click");
      
    },
    (cancel)=>{
      console.log("cancel click");
      
    })

  }



}
