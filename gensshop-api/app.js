var express = require("express");

var bodyParser = require("body-parser");

var app = express();

var order = require("./tbd_order/order.js");
const db = require("./db.js");

// เข้ารหัสส่งข้อมูล
app.use(express.urlencoded({ extended: true }));

app.use(express.json());

app.use(bodyParser.json());

// start server
app.listen(3000, () => {
  console.log("Server running port 3000");
});

// สร้าง API สำหรับเรียกข้อมูล Order
app.get("/order", order.getOrderList);
app.get('/orderwherecust_id',function(req,res){
  // รับค่าผ่าน form get
  let custid = req.query.cust_id
  // ติดต่อ db
  let sql = 'SELECT * From tbd_order WHERE cust_id=?'
  db.query(sql, custid, (err, results, fields) => {
      if (err) {
          res.status(500).json({
              'status': 500,
              'message': 'ไม่พบข้อมูล :' + err.sqlMessage
          });
      } else {
              let rs= {'Data': results};
      res.json(rs);
      }
  })
})
app.post("/order/add", order.addOrder);