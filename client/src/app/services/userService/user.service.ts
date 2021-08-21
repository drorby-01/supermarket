import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { FirstRegistration } from 'src/app/models/FirstRegistration';
import { SecondRegistration } from 'src/app/models/SecondRegistration';
import { UserLogin } from 'src/app/models/UserLogin';


@Injectable({
  providedIn: 'root'
})
export class UserService {

  public userRegisterFirstStep!: FirstRegistration;
  public userRegistrationSecondStep!: SecondRegistration;

  constructor(private http:HttpClient) { 

  }


  firstRegisterStep(){
    return this.http.post("http://localhost:3001/users/register/firstStep",this.userRegisterFirstStep)
  }

  secondRegisterStep(){
    const userRegister = {...this.userRegisterFirstStep,...this.userRegistrationSecondStep}
    return this.http.post("http://localhost:3001/users/",userRegister)
  }

  userLogin(userLogin:UserLogin){
    return this.http.post("http://localhost:3001/users/login",userLogin)
  }

  getUserDetails(){
    return this.http.get("http://localhost:3001/users/");
  }
}
