var path = require("path");

module.exports = {
  entry: [path.join(__dirname, "src", "neutrominator.coffee")],
  output: {
    path: path.join(__dirname, "dist"),
    filename: "neutrominator.js",
    library: "Neutrominator",
    libraryTarget: "umd",
  },
  module: {
    rules: [{ test: /\.coffee$/, loader: "coffee-loader" }],
  },
};
