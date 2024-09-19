const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

const User = require("../models/user.js");

////Sign Up Route////
const signUpNewUser = async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const userIsExisting = await User.findOne({ email });
    const passwordIsNotValid = password.length < 6;

    if (userIsExisting) {
      res
        .status(400)
        .json({ msgFromApi: "User with same email already exist" });
    } else if (passwordIsNotValid) {
      res.status(500).json({ msgFromApi: "please enter a long password" });
    } else {
      const hashedPassword = await bcryptjs.hash(password, 10);
      let user = new User({
        name,
        email,
        password: hashedPassword,
      });

      user = await user.save();
      res.status(200).json({ msgFromApi: "Account created successfully" });
    }
  } catch (error) {
    res.status(500).json({ msgFromApi: error.message });
  }
};
////Sign In Route////
const signIn = async (req, res) => {
  try {
    const { email, password } = req.body;
    const userIsExisting = await User.findOne({ email });
    const isMatch = await bcryptjs.compare(password, userIsExisting.password);
    if (userIsExisting && isMatch) {
      const token = jwt.sign({ id: userIsExisting._id }, "passwordKey");
      res.status(200).json({ token, ...userIsExisting._doc });
    } else {
      res.status(400).json({ msg: "Invalid email or password" });
    } 
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

////Token Is Valid Route////
const tokenIsValid = async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    const verified = jwt.verify(token, "passwordKey");
    const userIsExisting = await User.findById({ id: verified._id });
    verified && userIsExisting
      ? res.status(200).json(true)
      : res.status(400).json(false);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  signUpNewUser,
  signIn,
  tokenIsValid,
};
