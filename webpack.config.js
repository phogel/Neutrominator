const path = require("path");

module.exports = {
  entry: {
    neutrominator: path.join(__dirname, "src", "neutrominator.coffee"),
    popup: path.join(__dirname, "src", "popup.coffee"),
  },
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "[name].js",
  },
  mode: "production",
  module: {
    rules: [
      {
        test: /\.coffee$/,
        loader: "coffee-loader",
      },
    ],
  },
};
