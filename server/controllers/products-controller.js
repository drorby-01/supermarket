const router = require("express").Router();
const productLogic = require("../logic/product-logic");
const uploadFile = require("../helper/uploadFile");

//get all products
router.get("/", async (req, res, next) => {
  try {
    const products = await productLogic.getAllProduct();
    res.json(products);
  } catch (e) {
    next(e);
  }
});

//search product
router.get("/:search", async (req, res, next) => {
  try {
    const productSearch = "%" + req.params.search + "%";
    const result = await productLogic.getSearchProduct(productSearch);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

//add product
router.post("/", uploadFile, async (req, res, next) => {
  try {
    const product = req.body;
    const result = await productLogic.addProduct(product)
    console.log(result)
    res.json(product);
  } catch (e) {
    next(e);
  }
});


// update product
router.put("/",uploadFile,async (req, res, next) => {
  try {
    const product = req.body;
    const result = await productLogic.updateProduct(product);
    res.json(product);
  } catch (e) {
    next(e);
  }
});

module.exports = router;
