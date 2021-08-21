const router = require("express").Router();
const orderLogic = require("../logic/order-logic")

router.post("/",async (req,res,next)=>{
    try{
    const order= req.body;
    const result =await orderLogic.insertOrder(order)
    res.json(result)
    }catch(e){
        next(e)
    }
})

module.exports = router;