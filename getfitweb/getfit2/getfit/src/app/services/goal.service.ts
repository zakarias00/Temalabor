import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Goal } from './goal';

@Injectable({
  providedIn: 'root'
})
export class GoalService {

  private apiServerUrl = environment.apiBaseUrl;

  constructor(private http: HttpClient) { }

  public NewGoal(newGoal: Goal): Observable<Goal>{
    return this.http.post<Goal>(`${this.apiServerUrl}/GoalController`, newGoal);
  }

  public GetGoals(): Observable<Goal[]>{
    return this.http.get<Goal[]>(`${this.apiServerUrl}/GoalController/`);
  }

  public GetGoalById(id: number): Observable<number>{
    return this.http.get<number>(`${this.apiServerUrl}/GoalController/${id}`);
  }

  public updateGoal(goal: Goal): Observable<Goal>{
    return this.http.put<Goal>(`${this.apiServerUrl}/GoalController/${goal._id}`, goal);
  }

  public DeleteGoalById(id: number): Observable<void>{
    return this.http.delete<void>(`${this.apiServerUrl}/GoalController/${id}`);
  }
  
  public GetGoalForAWeek(dateStart: number, id: number): Observable<Goal[]>{
    return this.http.get<Goal[]>(`${this.apiServerUrl}/GoalController/date=${dateStart}/${id}`);
  }

  public GetGoalByUserId(id: number): Observable<Goal>{
    return this.http.get<Goal>(`${this.apiServerUrl}/GoalController/userId=${id}`);
  }

}
