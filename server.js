const express = require("express");
const app = express();

app.use(express.static("."));

const server = app.listen(3000, () =>
  console.log("Express listening on port 3000...")
);

process.on("SIGTERM", () => {
  server.close((err) => {
    if (err) {
      console.log(err);
      process.exit(1);
    }
    process.exit();
  });
});

process.on("SIGINT", () => {
  server.close(() => process.exit(0));
});
