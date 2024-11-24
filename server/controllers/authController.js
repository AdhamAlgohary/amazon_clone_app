const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

const User = require("../models/user.js");
const constants = require("../constants/constants.js");
const responseMsgs = require("../constants/response_msgs.js");

const PASSWORD_KEY = "passwordKey";

const sendClientExceptionResponse = (res, msg) =>
  res.status(400).json({ responseFromApi: msg });

const sendServerExceptionResponse = (res, error) =>
  res.status(500).json({ responseFromApi: error.message });

////Sign Up Route////
const signUpNewUser = async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const userIsExisting = await User.findOne({ email });
    const userIsValid = email.match(constants.EMAIL_REGEX);
    const passwordIsNotValid = password.length < 6;

    if (userIsExisting)
      return sendClientExceptionResponse(
        res,
        responseMsgs.USER_IS_EXISTING_MSG
      );
    else if (!userIsValid)
      return sendClientExceptionResponse(res, responseMsgs.VALID_EMAIL_MSG);
    else if (passwordIsNotValid)
      return sendClientExceptionResponse(res, responseMsgs.VALID_PASSWORD_MSG);
    else {
      const hashedPassword = await bcryptjs.hash(password, 10);
      let user = new User({
        name,
        email,
        password: hashedPassword,
      });

      user = await user.save();
      res
        .status(200)
        .json({ responseFromApi: responseMsgs.CREAT_ACCOUNT_SUCCESSFULLY_MSG });
    }
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};
////Sign In Route////
const signIn = async (req, res) => {
  const { email, password } = req.body;
  const userIsExisting = await User.findOne({ email });
  try {
    if (userIsExisting) {
      const isMatch = await bcryptjs.compare(password, userIsExisting.password);

      if (isMatch) {
        const token = jwt.sign({ id: userIsExisting._id }, PASSWORD_KEY);
        res.status(200).json({ token ,...userIsExisting._doc});
      } else
        return sendClientExceptionResponse(
          res,
          responseMsgs.INVALID_PASSWORD_MSG
        );
    } else
      return sendClientExceptionResponse(res, responseMsgs.INVALID_EMAIL_MSG);
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};

module.exports = {
  signUpNewUser,
  signIn,
};