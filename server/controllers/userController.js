const User = require("../models/user.js");

const sendServerExceptionResponse = (res, error) =>
  res.status(500).json({ responseFromApi: error.message });

const getUserData = async (req, res) => {
  try {
    const user = await User.findById(req.user);

    res.status(200).json({ ...user._doc, token: req.userToken });
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};

module.exports = { getUserData };
