import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { User } from '../services/user';
import { UserService } from '../services/user.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ActivityService } from '../services/activity.service';

@Component({
  selector: 'app-addactivity',
  templateUrl: './addactivity.component.html',
  styleUrls: ['./addactivity.component.css']
})
export class AddactivityComponent implements OnInit {

  loggedUser: User;
  addActivityForm = new FormGroup({
    sportId: new FormControl(),
    date: new FormControl(),
    time: new FormControl(),
    distance: new FormControl()
  });

  constructor(
    public modal: NgbActiveModal,
    public userService: UserService,
    private activityService: ActivityService
  ) { }

  ngOnInit(): void {
  }

  onSubmit(){

    this.activityService.NewActivity({
      _id: 0,
      date: this.addActivityForm.get('date')?.value,
      distance: this.addActivityForm.get('distance')?.value,
      kcal: 0,
      sportId: this.addActivityForm.get('sportId')?.value,
      time: this.addActivityForm.get('time')?.value,
      userId: parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))
    }).subscribe();
    
    this.modal.close();

  }

}
