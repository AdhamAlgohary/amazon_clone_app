const express = require("express");
const authRouter = express.Router();
const authController = require("../controllers/authController.js");

const signUpPath = "/signUpNewUser";
const signInPath = "/signIn";

authRouter.post(signUpPath, authController.signUpNewUser);
authRouter.post(signInPath, authController.signIn);

module.exports = authRouter;
