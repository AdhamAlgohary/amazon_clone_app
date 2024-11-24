const jwt = require("jsonwebtoken");

const responseMsgs = require("../constants/response_msgs.js");
const User = require("../models/user.js");

const authMiddleware = async (req, res, next) => {
  try {
    const userToken = req.header("cached-user-token");
    const isVerified = jwt.verify(userToken, "passwordKey");
    const userIsExisting = await User.findById({ _id: isVerified.id });

    if (isVerified && userIsExisting) {
      req.user = isVerified.id;
      req.userToken = userToken;
      next();
    } else {
      res.status(401).json({ responseFromApi: responseMsgs.INVALID_TOKEN_MSG });
    }
  } catch (error) {
    res.status(500).json({ responseFromApi: error.message });
  }
};

module.exports = { authMiddleware };
