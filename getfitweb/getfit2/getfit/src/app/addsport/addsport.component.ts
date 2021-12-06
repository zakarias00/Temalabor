import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { SportService } from '../services/sport.service';

@Component({
  selector: 'app-addsport',
  templateUrl: './addsport.component.html',
  styleUrls: ['./addsport.component.css']
})
export class AddsportComponent implements OnInit {

  addSportForm = new FormGroup({
    kcal: new FormControl(),
    type: new FormControl()
  });

  constructor(
    public modal: NgbActiveModal,
    private sportService: SportService
  ) { }

  ngOnInit(): void {
  }

  onSubmit(){

    this.sportService.NewSport({
      _id: 0,
      kcal: this.addSportForm.get('kcal')?.value,
      type: this.addSportForm.get('type')?.value
    }).subscribe();
    
    this.modal.close();

  }

}
