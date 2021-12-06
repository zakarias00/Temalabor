import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddsportComponent } from '../addsport/addsport.component';
import { Sport } from '../services/sport';
import { SportService } from '../services/sport.service';

@Component({
  selector: 'app-sports',
  templateUrl: './sports.component.html',
  styleUrls: ['./sports.component.css']
})
export class SportsComponent implements OnInit {

  allSports: Sport[] = [];
  searchsporttype: string;

  constructor(
    private sportService: SportService,
    private modalService: NgbModal
  ) { }

  ngOnInit(): void {
    this.sportService.GetSports().subscribe(
      (allSports) => {
        (this.allSports = allSports);
      }
    )
  }

  Search(){
    if(this.searchsporttype != ""){
      this.allSports = this.allSports.filter(res=>{
        return res.type.toLocaleLowerCase().match(this.searchsporttype.toLocaleLowerCase());
      })
    }else if(this.searchsporttype == ""){
      this.ngOnInit();
    }     
  }

  addSport(){
    const ref = this.modalService.open(AddsportComponent)

    ref.result.then((yes)=>{
      console.log("ok click");
      
    },
    (cancel)=>{
      console.log("cancel click");
      
    })
  }

}
