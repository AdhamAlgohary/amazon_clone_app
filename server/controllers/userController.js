const User = require("../models/user.js");

const getUserData = async (req, res) => {
  try {
    const user = await User.findById(req.user);
    res.status(200).json({ ...user._doc, token: req.token });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { getUserData };
