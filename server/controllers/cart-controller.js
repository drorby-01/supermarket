const router = require("express").Router();
const chace = require("../logic/cache-module");
const cartLogic = require("../logic/cart-logic");

router.get("/", async (req, res, next) => {
  try {
    const clientIdentity = chace.extractUserDataFromCache(req).identity;
    const result = await cartLogic.getCart(clientIdentity);
    res.json(result);
  } catch (e) {
    next(e);
  }
});


router.get("/allClientProduct/:cartId", async (req, res, next) => {
  try {
    const cartId = req.params.cartId;
    const result = await cartLogic.getAllClientProduct(cartId);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

router.delete("/all/:cartId", async (req, res, next) => {
  try {
    console.log("delete all");
    const { cartId } = req.params;
    const result = await cartLogic.deleteAllProductsFromCart(cartId);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

router.delete("/:cartId/product/:productId", async (req, res, next) => {
  try {
    const { productId, cartId } = req.params;
    const result = await cartLogic.deleteProductFromCart(productId, cartId);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

router.post("/", async (req, res, next) => {
  try {
    const productToCart = req.body;
    const result = await cartLogic.insertProductToCart(productToCart);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

module.exports = router;
