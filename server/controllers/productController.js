const Product = require("../models/product");

const sendServerExceptionResponse = (res, error) =>
  res.status(500).json({ responseFromApi: error.message });

const addProductController = async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    const product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    await product.save();
    res.json(product);
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};

module.exports = { addProductController };
