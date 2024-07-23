const express = require("express");
const authRouter = express.Router();
const authController = require("../controllers/authController.js");

const signUpPath = "/signUpNewUser";
const signInPath = "/signIN";
const tokenIsValidPath = "/tokenIsValid";

//signUpRoute
authRouter.post(signUpPath, authController.signUpNewUser);
authRouter.post(signInPath, authController.signIn);
authRouter.post(tokenIsValidPath, authController.tokenIsValid);

module.exports = authRouter;
