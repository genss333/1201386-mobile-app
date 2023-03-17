const db = require("../db.js");

const order = {
  getOrderList: (req, res) => {
    let sql = "select * from tbd_order";
    db.query(sql, (err, results) => {
      if (err) {
        console.log(err);
        res.json({
          status: false,
          message: "Error Occured",
        });
      } else {
        res.json({
          status: true,
          data: results,
          message: "Order List",
        });
      }
    });
  },
  getOrderByOrderNo: (req, res) => {
    let sql = "select * from tbd_order where order_no = ?";
    let data = req.query.orderno;
    db.query(sql, data, (err, results) => {
      if (err) {
        console.log(err);
        res.json({
          status: false,
          message: "Error Occured",
        });
      } else {
        res.json({
          status: true,
          data: results,
          message: "Order List",
        });
      }
    });
  },

  addOrder: (req, res) => {
    let sql = "insert into tbd_order set ?";
    let data = {
      cust_id: req.body.cust_id,
      product_name: req.body.product_name,
      product_source: req.body.product_source,
      order_num: req.body.order_num,
    };
    db.query(sql, data, (err) => {
      if (err) {
        res.status(500).json({
          status: 500,
          message: "ไม่สามารถเพิ่มข้อมูลได้ :" + err.sqlMessage,
        });
      } else {
        let result = {
          status: 200,
          message: "เพิ่มข้อมูลเรียบร้อย",
        };
        res.json(result);
      }
    });
  },

  updateOrder: (req, res) => {
    let sql = "update tbd_order set ? where order_no = ?";
    let data = {
      cust_id: req.body.cust_id,
      product_name: req.body.product_name,
      product_source: req.body.product_source,
      order_num: req.body.order_num,
    }
    let id = req.params.id;
    
    db.query(sql, [data, id], (err) => {
      if (err) {
        res.status(500).json({
          status: 500,
          message: "ไม่สามารถแก้ไขข้อมูลได้ :" + err.sqlMessage,
        });
      } else {
        let result = {
          status: 201,
          message: "แก้ไขข้อมูลเรียบร้อย",
        };
        res.json(result);
      }
    });
  },

  deleteOrder: (req, res) => {
    let sql = "delete from tbd_order where order_no = ?";
    let id = req.params.id;

    db.query(sql, id, (err) => {
      if (err) {
        res.status(500).json({
          status: 500,
          message: "ไม่สามารถลบข้อมูลได้ :" + err.sqlMessage,
        });
      } else {
        let result = {
          status: 202,
          message: "ลบข้อมูลเรียบร้อย",
        };
        res.json(result);
      }
    });
  }

};
module.exports = order;
