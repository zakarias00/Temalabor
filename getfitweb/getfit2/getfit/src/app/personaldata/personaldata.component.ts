import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { User } from '../services/user';
import { UserService } from '../services/user.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-personaldata',
  templateUrl: './personaldata.component.html',
  styleUrls: ['./personaldata.component.css']
})
export class PersonaldataComponent implements OnInit {

  registrationForm = new FormGroup({
    username: new FormControl(),
    name: new FormControl(),
    email: new FormControl(),
    password: new FormControl(),
    birthdate: new FormControl(),
    height: new FormControl(),
    weight: new FormControl(),
    gender: new FormControl()
  }); 

  constructor(
    private userService: UserService,
    private router: Router) { }

  ngOnInit(): void {
  }

  onSubmit(){
    this.userService.NewUser({
      _id: 0,
      username: this.registrationForm.get('username')?.value,
      name: this.registrationForm.get('name')?.value,
      email: this.registrationForm.get('email')?.value,
      password: this.registrationForm.get('password')?.value,
      points: 0,
      level: 0,
      birthdate: this.registrationForm.get('birthdate')?.value,
      height: this.registrationForm.get('height')?.value,
      weight: this.registrationForm.get('weight')?.value,
      gender: this.registrationForm.get('gender')?.value
    })
    .subscribe()

    this.router.navigate(['/profile']);
  }
  
}
