import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { updateClassExpression } from 'typescript';
import { User } from '../services/user';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-leaderboard',
  templateUrl: './leaderboard.component.html',
  styleUrls: ['./leaderboard.component.css']
})
export class LeaderboardComponent implements OnInit {

  users: User[] = [];
  searchusername: string;
 
  constructor(private userService: UserService) { }

  ngOnInit(): void {
    this.rankUsers();
  }

  rankUsers(){
    this.userService.GetUsers()
    .subscribe((users)=>{
      (this.users = users);
      var sortedUsers: User[] = this.users.sort((n1,n2) => {
        if (n1.points > n2.points) {
            return -1;
        }
    
        if (n1.points < n2.points) {
            return 1;
        }
    
        return 0;
      });
  
      this.users = sortedUsers;

    });    
    
  }

  Search(){
    if(this.searchusername != ""){
      this.users = this.users.filter(res=>{
        return res.username.toLocaleLowerCase().match(this.searchusername.toLocaleLowerCase());
      })
    }else if(this.searchusername == ""){
      this.ngOnInit();
    }       
  }

}
