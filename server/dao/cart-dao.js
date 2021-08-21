const ErrorType = require("../errors/error-type");
const ServerError = require("../errors/server-error");
const database = require("./connaction-wraper");

const createCart = async (userIdentity) => {
  try {
    const sql = "insert into cart(client_identity) values(?)";
    const parameters = [userIdentity];
    const result = await database.exceuteWithParameters(sql, parameters);
    console.log("create cart successfully");
    const id = { id: result["insertId"] };
    return id;
  } catch (e) {
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

const closeCart = async (cartId) => {
  try {
    const sql = `update cart set is_open=? where id = ?`;
    const parameters = [false, cartId];
    const result = await database.exceuteWithParameters(sql, parameters);
    return result;
  } catch (e) {
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

const getCart = async (userIdentity) => {
  try {
    const sql = `select id,is_open as isOpen from cart where client_identity = ? order by id  desc  limit 1;`;
    const parameters = [userIdentity];
    let result = await database.exceuteWithParameters(sql, parameters);
    console.log(result[0])
    if (result.length === 0 || result[0].isOpen==0) {
      result = await createCart(userIdentity);
      return result;
    }
    console.log("get cart successfully");
    return result[0];
  } catch (e) {
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

const getAllClientProduct = async (cartId) => {
  try {
    const sql = `select capacity,cp.price,product_name as productName,image,cp.cart_id as cartId,product.id as productId from cartproduct cp  inner join product on cp.product_id = product.id where cp.cart_id = ? `;
    const parametrs = [cartId];
    const result = await database.exceuteWithParameters(sql, parametrs);
    return result;
  } catch (e) {
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

// when i make it i will make input type number and button
const insertProductToCart = async (cartProduct) => {
  try {
    console.log(cartProduct);
    const sql = `insert into CartProduct(product_id,capacity,price,cart_id) values(?,?,?,?)`;
    const parameters = [
      Number(cartProduct.id),
      Number(cartProduct.capacity),
      Number(cartProduct.price) * Number(cartProduct.capacity),
      Number(cartProduct.cartId),
    ];
    const result = await database.exceuteWithParameters(sql, parameters);
    return result;
  } catch (e) {
    console.log(e.message);
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

const deleteProductFromCart = async (productId, cartId) => {
  try {
    const sql = `delete from CartProduct where product_id = ? and cart_id = ?`;
    const parameters = [productId, cartId];
    return await database.exceuteWithParameters(sql, parameters);
  } catch (e) {
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

const deleteAllProductsFromCart = async (cartId) => {
  try {
    const sql = `delete from  CartProduct where cart_id = ?`;
    const parameters = [cartId];
    return await database.exceuteWithParameters(sql, parameters);
  } catch (e) {
    throw new ServerError(ErrorType.GENERAL_ERROR, sql, e);
  }
};

module.exports = {
  getAllClientProduct,
  getCart,
  closeCart,
  deleteProductFromCart,
  insertProductToCart,
  deleteAllProductsFromCart,
};
