const jwt = require("jsonwebtoken");
const authMiddleware = async (req, res, next) => {
  try {
    const token = req.headers("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OWNmMjRkN2ViZjUwODlkOGU4YTZiMiIsImlhdCI6MTcyMTY1MDgxOX0.tleX_mr6TNGjS3F_1Kydp4uwTICQPffYsJ7TwcBwUBc");
    const isVerified = jwt.verify(token, "passwordKey");
    if (isVerified) {
      req.user = isVerified.id;
      req.token = token;
      next();
    } else {
      res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = { authMiddleware };
