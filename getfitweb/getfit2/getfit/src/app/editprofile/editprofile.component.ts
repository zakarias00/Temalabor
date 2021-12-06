import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { User } from '../services/user';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-editprofile',
  templateUrl: './editprofile.component.html',
  styleUrls: ['./editprofile.component.css']
})
export class EditprofileComponent implements OnInit {

  loggedUser: User;
  editForm= new FormGroup({
    height: new FormControl(),
    weight: new FormControl()
  }); 

  constructor(
    public modal: NgbActiveModal,
    public userService: UserService,
    private router: Router) { }

  ngOnInit(): void {
      
  }

  onSubmit(){
    this.userService.GetUserById(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
      loggedUser=>{this.loggedUser = loggedUser;

        this.userService.updateUser(this.loggedUser._id, 
          {
            _id: this.loggedUser._id,
            username: this.loggedUser.username,
            name: this.loggedUser.name,
            email: this.loggedUser.email,
            password: this.loggedUser.password,
            points: this.loggedUser.points,
            level: this.loggedUser.level,
            birthdate: this.loggedUser.birthdate,
            height: this.editForm.get('height')?.value,
            weight: this.editForm.get('weight')?.value,
            gender: this.loggedUser.gender
          }
          ).subscribe();
    
        this.modal.close();
      }
    )
    
  }

}
