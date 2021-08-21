import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { GetProduct } from 'src/app/models/GetProduct';
import { PostProduct } from 'src/app/models/PostProduct';
import { PutProduct } from 'src/app/models/PutProduct';

@Injectable({
  providedIn: 'root'
})
export class ProductsService {
  public productToUpdate!: GetProduct;
  public productShowModal!: GetProduct;
  public products: GetProduct[] = []
  public productsCategory!: string;

  constructor(private http: HttpClient) { }

  getAllProducts(): Observable<Array<GetProduct>> {
    return this.http.get<Array<GetProduct>>("http://localhost:3001/products")
  }


  addProduct(product: FormData) {
    return this.http.post<{ image: string }>("http://localhost:3001/products", product);
  }

  putProduct(product: FormData) {
    return this.http.put<PutProduct>("http://localhost:3001/products", product);
  }

  getProductsSearch(productSearch: string): Observable<Array<GetProduct>> {
    return this.http.get<Array<GetProduct>>(`http://localhost:3001/products/${productSearch}`)
  }
}
