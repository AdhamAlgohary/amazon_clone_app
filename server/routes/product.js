const express = require("express");
const productRouter = express.Router();

const addProductPath = "/admin/addProduct";
const adminMiddleWare = require("../middleware/admin.js");
const productController = require("../controllers/productController.js");

productRouter.post(
  addProductPath,
  adminMiddleWare.adminMiddleware,
  productController.addProductController
);

module.exports = productRouter;
