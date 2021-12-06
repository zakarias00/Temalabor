import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http'
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import{User} from './user';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private apiServerUrl = environment.apiBaseUrl;

  constructor(private http: HttpClient) { }

  public NewUser(newUser: User): Observable<User>{
    return this.http.post<User>(`${this.apiServerUrl}/UserController/`, newUser);
  }

  public GetUsers(): Observable<User[]>{
    return this.http.get<User[]>(`${this.apiServerUrl}/UserController/`);
  }
  
  public GetUserById(id: number): Observable<User>{
    return this.http.get<User>(`${this.apiServerUrl}/UserController/${id}`);
  }

  public updateUser(id: number, user: User): Observable<User>{
    return this.http.put<User>(`${this.apiServerUrl}/UserController/${id}`, user);
  }

  public DeleteUserById(id: number): Observable<void>{
    return this.http.delete<void>(`${this.apiServerUrl}/UserController/${id}`);
  }  

  public GetUserByName(name:string): Observable<User>{
    return this.http.get<User>(`${this.apiServerUrl}/UserController/${name}`);
  }

}
