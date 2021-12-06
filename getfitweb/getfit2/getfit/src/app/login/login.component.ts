import { Component, OnInit } from '@angular/core';
import { UserService } from '../services/user.service';
import { User } from '../services/user';
import { FormBuilder, FormGroup, Validators, FormsModule, ReactiveFormsModule, FormControl } from '@angular/forms';
import { Router,NavigationStart} from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm = new FormGroup({
    email: new FormControl(),
    password: new FormControl()
  }); 
  users: User[] = [];
  loggedUser: User;

  constructor(
    private userService: UserService,
    private router: Router,
    private toastr: ToastrService) { }

  ngOnInit(): void {
  }

  onSubmit(){
    this.userService.GetUsers()
    .subscribe((users)=>{
      (this.users = users);

      let valid: boolean = false;

      for(let user of this.users){
        if(user.email == this.loginForm.get('email')!.value && user.password == this.loginForm.get('password')!.value){
          this.loggedUser = user;
          if(user._id!=null){
            localStorage.setItem('loggeduser', user._id.toString());
          }
          valid = true;
          if(user.email == "admin" && user.password == "admin"){
            this.router.navigate(['/sports']);
          }else{
            this.router.navigate(['/profile']);
          }
        }
      }

      if(valid){
        this.toastr.success('Successful login!')
      }else{
        this.toastr.warning('Invalid login data!')
      }

    });

    

  }

}
