import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CartProductFront } from 'src/app/models/CartProductFront';
import { CartProductPost } from 'src/app/models/CartProductPost';


@Injectable({
  providedIn: 'root'
})
export class CartProductService {

  public userCartId!: { id: number };
  public cartProductFront: Array<CartProductFront> = [];

  public cartPriceTotal: number = 0
  constructor(private http: HttpClient) { }

  getCart() {
    return this.http.get<{ id: number }>("http://localhost:3001/cart")
  }

  postProductToCart(product: CartProductPost) {
    return this.http.post("http://localhost:3001/cart", product)
  }

  getAllCartProduct(cartId: number) {
    return this.http.get<Array<CartProductFront>>(`http://localhost:3001/cart/allClientProduct/${cartId}`)
  }

  deleteProductFromCart(cartId: number, productId: number) {
    return this.http.delete(`http://localhost:3001/cart/${cartId}/product/${productId}`)
  }

  deleteAllProductInCart(cartId: number) {
    return this.http.delete(`http://localhost:3001/cart/all/${cartId}`)
  }

  // productCartListColor(value: string) {

  //   const productsCartWithStyle: Array<CartProductFrontColor> = this.cartProductFront.map((element: CartProductFront): any => { return { ...element, color: "white" } });
  //   const productCartToColor = productsCartWithStyle.map((element: CartProductFrontColor) => {

  //     if (element.productName.includes(value)) {
  //       element.color = "yellow"
  //       return element;
  //     } else {
  //       element.color = "white"
  //       return element
  //     }
  //   });

}
