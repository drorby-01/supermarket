const router = require("express").Router()
const marketLog = require("../logic/market-logic")
router.get("/",async (req,res,next)=>{
    try{
        const result = await marketLog.getStoreInformation()
        res.json(result)
    }catch(e){
        next(e)
    }
})

module.exports = router;