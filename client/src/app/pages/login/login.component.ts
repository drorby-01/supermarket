import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { observable } from 'rxjs';
import { UserLogin } from 'src/app/models/UserLogin';
import { MarketService } from 'src/app/services/marketService/market.service';
import { UserService } from 'src/app/services/userService/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  public productsInStore:number =0;
  public ordersInStroe:number = 0;
  public loginUser!: FormGroup;
  public userName!: FormControl;
  public password!: FormControl;
  public error: string ="";

  constructor(public userOperation: UserService,public router : Router,public marketInfo :MarketService) {
    this.userName = new FormControl("",[Validators.required,Validators.email]);
    this.password = new FormControl("",[Validators.required,Validators.minLength(8),Validators.maxLength(12)]);
    this.loginUser = new FormGroup({userName:this.userName,password: this.password});
   }

  ngOnInit( ): void {
    const observable = this.marketInfo.getMarketInformation()
    observable.subscribe((HttpResponseData)=>{
      console.log(HttpResponseData);
      const [storeIformation]:any =HttpResponseData;
      this.productsInStore = storeIformation.products;
      this.ordersInStroe = storeIformation.orders;
    },(HttpResponseError)=>{
      console.log(HttpResponseError)
    })

    


  }

  login(){
    const user = new UserLogin(this.userName.value,this.password.value)
    console.log(user)
    const observable = this.userOperation.userLogin(user)

    observable.subscribe((httpResponseData:any)=>{
      this.error ="";
      const token = "Bearer " + httpResponseData.token
      sessionStorage.setItem("token",token)
      if(httpResponseData.isAdmin == 0){
        this.router.navigate(["/products/user"])
      }else {
        this.router.navigate(["/products/admin"])
      }
      
    },(httpResponseError)=>{
      this.error = httpResponseError.error.error;
    })
  }

}
