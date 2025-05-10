const express = require("express");
const app = express();

const PORT = process.env.PORT || 8082;

app.use(express.json());

app.get("/payment/status", (req, res) => {
  res.json({ message: "Payment status checked!" });
});

app.post("/payment/pay", (req, res) => {
  const { amount } = req.body;
  res.json({ message: `Paid $${amount}` });
});

app.listen(PORT, () => {
  console.log(`Payment service running on port ${PORT}`);
});

