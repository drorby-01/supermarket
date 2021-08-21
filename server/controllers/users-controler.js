const router = require("express").Router();
const userLogic = require("../logic/user-logic");
const chaceModule = require("../logic/cache-module");
const ValidateUser = require("../validator/validatorUser");

///register route

router.post("/register/firstStep", async (req, res, next) => {
  try {
    const user = req.body;
    await userLogic.userRegisterFirstStep(user);
    res.json({ message: "first step of the registration look good" });
  } catch (e) {
    next(e);
  }
});

router.post("/", async (req, res, next) => {
  try {
    const user = req.body;
    const result = await userLogic.userRegister(user);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

router.post("/login", async (req, res, next) => {
  try {
    const user = req.body;
    const result = await userLogic.userLogin(user);
    res.json(result);
  } catch (e) {
    next(e);
  }
});

router.get("/", async (req, res, next) => {
  const user = chaceModule.extractUserDataFromCache(req);
  res.json(user);
});

module.exports = router;
