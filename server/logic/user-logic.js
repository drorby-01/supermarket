const jwt = require("jsonwebtoken");
const userDao = require("../dao/user-dao");
const ValidateUser = require("../validator/validatorUser");
const config = require("../config.json");
const chaceModule = require("./cache-module")

const RIGHT_SALT = "ksdjfhbAWEDCAS29!@$addlkmn";
const LEFT_SALT = "32577098ASFKJkjsdhfk#$dc";

const userRegister = async (user)=>{
await ValidateUser.validateRegister(user)

const result = await userDao.userRegister(user)

return result;
}

const userRegisterFirstStep = async (user)=>{
    await ValidateUser.validateRegisterFirstStep(user)

}

const userLogin = async (user)=>{
    let saltedUserName = LEFT_SALT + user.userName + RIGHT_SALT;
    await ValidateUser.validateLogin(user)
    const [userData] = await userDao.userIsExit(user);
    console.log(userData);
    const jwtToken = jwt.sign({ sub: saltedUserName }, config.secret);
    chaceModule.set(jwtToken,userData);
    let successfullLoginResponse = {token:jwtToken,isAdmin:userData.isAdmin}
    return successfullLoginResponse;
}


module.exports = {
    userRegister,
    userLogin,
    userRegisterFirstStep
}