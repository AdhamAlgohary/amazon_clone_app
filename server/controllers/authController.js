const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

const User = require("../models/user.js");
const constants = require("../constants.js");

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
    const userIsValid = email.match(constants.emailRegex);
    const passwordIsNotValid = password.length < 6;

    if (userIsExisting)
      return sendClientExceptionResponse(
        res,
        "User with same email already exist"
      );


    else if (!userIsValid)
      return sendClientExceptionResponse(res, "Please enter valid e-mail");

    else if (passwordIsNotValid)
      return sendClientExceptionResponse(res, "Please enter long password");

    else {
      const hashedPassword = await bcryptjs.hash(password, 10);
      let user = new User({
        name,
        email,
        password: hashedPassword,
      });

      user = await user.save();
      res.status(200).json({ responseFromApi: "Account created successfully" });
    }
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};
////Sign In Route////
const signIn = async (req, res) => {
  try {
    if (userIsExisting) {
      const isMatch = await bcryptjs.compare(password, userIsExisting.password);

      if (isMatch) {
        const userToken = jwt.sign({ id: userIsExisting._id }, PASSWORD_KEY);

        res.status(200).json({ userToken});

      } else return sendClientExceptionResponse(res, "Invalid password");

    } else return sendClientExceptionResponse(res, "Invalid email ");
  } catch (error) {
    return sendServerExceptionResponse(res, error);
  }
};


////Token Is Valid Route////
// const tokenIsValid = async (req, res) => {
//   try {
//     const token = req.header("x-auth-token");
//     const verified = jwt.verify(token, "passwordKey");
//     const userIsExisting = await User.findById({ id: verified._id });

//     verified && userIsExisting
//       ? res.status(200).json(true)
//       : res.status(400).json(false);
//   } catch (error) {
//     sendServerExceptionResponse(res, error);
//   }
// };

module.exports = {
  signUpNewUser,
  signIn,
  // tokenIsValid,
};
