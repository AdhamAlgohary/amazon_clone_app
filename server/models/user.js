const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name:{
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const regex =
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return value.match(regex);
      },
      message: "Please enter a valid email",
    },  },
    password: {
      required: true,
      type: String,
      validate: {
        validator: (value) => value.length > 6,
      },
      message: "please enter a long password",
    },
    address: {
      required: false,
      type: String,
      default: "",
    },
    type: {
      required: false,
      type: String,
      default: "user",
    },

});

const User = mongoose.model("User", userSchema);
module.exports = User;
