const express = require("express");
const app = express()
const cors = require("cors");
const path = require("path")
const loginFilter = require("./helper/loginfilter")
const errorHandler = require("./errors/error-handler");
const productControllerr = require("./controllers/products-controller");
const userController = require("./controllers/users-controler")
const marketController = require("./controllers/market-controller")
const cartController = require("./controllers/cart-controller")
const orderController = require("./controllers/order-controller")
const fileUpload = require("express-fileupload");

app.use(express.json())
app.use(cors())
app.use(fileUpload())

app.use(loginFilter())
app.use("/images",express.static("./images"))
app.use("/market",marketController)
app.use("/users",userController)
app.use("/products",productControllerr)
app.use("/cart",cartController)
app.use("/order",orderController)
app.use(errorHandler)

app.listen(3001,()=>console.log("http://localhost:3001/users/"))