const express = require("express");
const userRouter = express.Router();

const authMiddleware = require("../middleware/auth.js");
const getUserDataController = require("../controllers/userController.js");

const getUserDataPath = "/getUserData";

userRouter.get(
  getUserDataPath,
  authMiddleware.authMiddleware,
  getUserDataController.getUserData
);

module.exports =  userRouter ;
