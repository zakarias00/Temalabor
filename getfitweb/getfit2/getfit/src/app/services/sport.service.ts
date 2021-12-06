import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http'
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Sport } from './sport';

@Injectable({
  providedIn: 'root'
})
export class SportService {

  private apiServerUrl = environment.apiBaseUrl;

  constructor(private http: HttpClient) { }

  public NewSport(newSport: Sport): Observable<Sport>{
    return this.http.post<Sport>(`${this.apiServerUrl}/SportController`, newSport);
  }

  public GetSports(): Observable<Sport[]>{
    return this.http.get<Sport[]>(`${this.apiServerUrl}/SportController/`);
  }

  public GetSportById(id: number): Observable<number>{
    return this.http.get<number>(`${this.apiServerUrl}/SportController/${id}`);
  }

  public updateSport(sport: Sport): Observable<Sport>{
    return this.http.put<Sport>(`${this.apiServerUrl}/SportController/${sport._id}`, sport);
  }

  public DeleteSportById(id: number): Observable<void>{
    return this.http.delete<void>(`${this.apiServerUrl}/SportController/${id}`);
  } 

}
