import { ProductCategory } from "./ProductCategory";

export class PutProduct {
    constructor(public id: number,public productName:string,public categoryId:ProductCategory,public price :number,public image:string) { }
}