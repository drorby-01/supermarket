import { ProductCategory } from "./ProductCategory";

export class PostProduct {
    constructor(public productName:string,public categoryId:ProductCategory,public price :number){
    }
}