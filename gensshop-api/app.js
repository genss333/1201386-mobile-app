var express = require("express");

var bodyParser = require("body-parser");

var app = express();

var order = require("./tbd_order/order.js");
const db = require("./db.js");

// เข้ารหัสส่งข้อมูล
app.use(express.urlencoded({ extended: true }));

app.use(express.json());

// start server
app.listen(3000, () => {
  console.log("Server running port 3000");
});

// สร้าง API สำหรับเรียกข้อมูล Order
app.get("/order", order.getOrderList);
app.get("/order/:cust_id", order.getOrderByCustId);
app.post("/order/add", order.addOrder);
app.delete("/order/delete", order.deleteOrder);
app.put("/order/update/:order_no", order.updateOrder);
