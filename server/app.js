//Import from package
const express = require("express");
const mongoose = require("mongoose");
//Import from other files
const routes = require("./routes/routes.js");
const constants = require("./constants/constants.js");
//Init
const app = express();
const PORT = 8000;
//middleware
app.use(express.json());
app.use(routes.authRoutes);
app.use(routes.getUserDataRoutes);
app.use(routes.productRoutes);

//Connetcing to database

mongoose
  .connect(constants.DATABASE_URL)
  .then(() => {
    console.log("Connection to database is suucessfully");
  })
  .catch((e) => console.log(` error : ${e.message}`));

//Creating An API
app.listen(PORT, "192.168.1.20", () => {
  console.log(`Server running on port ${PORT}`);
});
