import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { GoalService } from '../services/goal.service';
import { User } from '../services/user';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-addgoal',
  templateUrl: './addgoal.component.html',
  styleUrls: ['./addgoal.component.css']
})
export class AddgoalComponent implements OnInit {

  loggedUser: User;
  addGoalForm = new FormGroup({
    amount: new FormControl(),
    dateStart: new FormControl()
  });

  constructor(
    public modal: NgbActiveModal,
    public userService: UserService,
    public goalService: GoalService
  ) { }

  ngOnInit(): void {
  }

  onSubmit(){
    this.goalService.NewGoal({
      _id: 0,
      amount: this.addGoalForm.get('amount')?.value,
      currentAmount: 0,
      dateStart: this.addGoalForm.get('dateStart')?.value,
      status:0,
      userId: parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))
    }).subscribe();
    
    this.modal.close();
  }

}
