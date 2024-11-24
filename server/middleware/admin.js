const jwt = require("jsonwebtoken");
const User = require("../models/user.js");

const responseMsgs = require("../constants/response_msgs.js");

const sendServerExceptionResponse = (res, error) =>
  res.status(500).json({ responseFromApi: error.message });

const adminMiddleware = async (req, res, next) => {
  try {
    const userToken = req.header("cached-user-token");
    const isVerified = jwt.verify(userToken, "passwordKey");
    const userIsExisting = await User.findById({ _id: isVerified.id });

    if (isVerified && userIsExisting) {
      if (userIsExisting.type == "user")
        return res
          .status(401)
          .json({ responseFromApi: responseMsgs.INVALID_TYPE_MSG });

      req.user = isVerified.id;
      req.userToken = userToken;
      next();
    } else
      res.status(401).json({ responseFromApi: responseMsgs.INVALID_TOKEN_MSG });
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};

module.exports = { adminMiddleware };
