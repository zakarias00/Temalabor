import { Component, OnInit } from '@angular/core';
import { User } from '../services/user';
import { UserService } from '../services/user.service';
import { ModalDismissReasons, NgbModal, NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { EditprofileComponent } from '../editprofile/editprofile.component';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {

  closeResult: string;
  loggedUser: User;

  birth: Date;

  constructor(
    private userService: UserService,
    private modalService: NgbModal)
    {
    this.userService.GetUserById(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
      loggedUser=>{this.loggedUser = loggedUser;
      this.birth = new Date(this.loggedUser.birthdate);
      }
    )
  }

  ngOnInit(): void { 
  }

  editUser(user: User){
    const ref = this.modalService.open(EditprofileComponent)
    ref.componentInstance.loggedUser = user;

    ref.result.then((yes)=>{
      console.log("ok click");
      
    },
    (cancel)=>{
      console.log("cancel click");
      
    })

    this.userService.GetUserById(parseInt(JSON.parse(localStorage.getItem('loggeduser') || '{}'))).subscribe(
      loggedUser=>{this.loggedUser = loggedUser;}
    )

  }

}
