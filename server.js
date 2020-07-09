const express = require("express");
const app = express();

app.use(express.static("."));

const a = app.listen(3000, () =>
  console.log("Express listening on port 3000...")
);

process.on("SIGTERM", () => {
  console.log("sig term...");
  a.close((err) => {
    if (err) {
      console.log(err);
      process.exit(1);
    }

    process.exit();
  });
});

process.on("SIGINT", () => {
  console.log("sig int...");
  process.exit();
});
