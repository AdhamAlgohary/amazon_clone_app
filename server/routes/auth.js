const express = require("express");
const authRouter = express.Router();
const authController = require("../controllers/authController.js");
const  userController = require("../controllers/userController.js");

const signUpPath = "/signUpNewUser";
const signInPath = "/signIn";
const tokenIsValidPath = "/tokenIsValid";


authRouter.post(signUpPath, authController.signUpNewUser);
authRouter.post(signInPath, authController.signIn);
// authRouter.post(tokenIsValidPath, authController.tokenIsValid);

module.exports = authRouter;
