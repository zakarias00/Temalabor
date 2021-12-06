import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Activity } from './activity';

@Injectable({
  providedIn: 'root'
})
export class ActivityService {

  private apiServerUrl = environment.apiBaseUrl;

  constructor(private http: HttpClient) { }

  public NewActivity(newActivity: Activity): Observable<Activity>{
    return this.http.post<Activity>(`${this.apiServerUrl}/ActivityController`, newActivity);
  }

  public GetActivities(): Observable<Activity[]>{
    return this.http.get<Activity[]>(`${this.apiServerUrl}/ActivityController/`);
  }

  public GetActivityById(id: number): Observable<number>{
    return this.http.get<number>(`${this.apiServerUrl}/ActivityController/${id}`);
  }

  public updateActivity(activity: Activity): Observable<Activity>{
    return this.http.put<Activity>(`${this.apiServerUrl}/ActivityController/${activity._id}`, activity);
  }

  public DeleteActivityById(id: number): Observable<void>{
    return this.http.delete<void>(`${this.apiServerUrl}/ActivityController/${id}`);
  }

  public GetActivityBySportId(id: number, sportid: number): Observable<Activity[]>{
    return this.http.get<Activity[]>(`${this.apiServerUrl}/ActivityController/userId=${id}/sportId=${sportid}`);
  }

  public GetActivityByUserId(id: number): Observable<Activity[]>{
    return this.http.get<Activity[]>(`${this.apiServerUrl}/ActivityController/userId=${id}`);
  }

  public GetActivitiesForAWeek(date: number, id: number): Observable<Activity>{
    return this.http.get<Activity>(`${this.apiServerUrl}/ActivityController/week=${date}/${id}`);
  }
}
