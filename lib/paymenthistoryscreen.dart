//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:superchef/orderdetailscreen.dart';
//import 'package:http/http.dart' as http;
import 'orderdetailscreen.dart';
import 'user.dart';
import 'package:intl/intl.dart';

class PaymentHistoryScreen extends StatefulWidget {
  final User user;

  const PaymentHistoryScreen({Key key, this.user}) : super(key: key);

  @override
  _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  //List _paymentdata;

  String titlecenter = "Loading payment history...";
  final f = new DateFormat('dd-MM-yyyy hh:mm a');
  var parsedDate;
  double screenHeight, screenWidth;

  @override
  void initState() {
    super.initState();
    //_loadPaymentHistory();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Payment History'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text(
            "Payment History",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
              child: InkWell(
                  onTap: () => loadOrderDetails(),
                  child: Card(
                    color: Colors.orange[200],
                    elevation: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Text(
                              " 1",
                              // (index + 1).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              "RM 40.00 ",
                              // _paymentdata[index]['total'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            )),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "sc-18042020-000001",
                                  // _paymentdata[index]['orderid'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                                Text(
                                  "qwerTYda",
                                  // _paymentdata[index]['billid'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                              ],
                            )),
                         Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "18-04-2020",                                
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                                Text(
                                  "09:15 AM",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ))),

                Padding(
              padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
              child: InkWell(
                  onTap: () => loadOrderDetails(),
                  child: Card(
                    color: Colors.orange[200],
                    elevation: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Text(
                              " 2",
                              // (index + 1).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              "RM 25.00 ",
                              // _paymentdata[index]['total'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            )),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "sc-20052020-000002",
                                  // _paymentdata[index]['orderid'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                                Text(
                                  "mitnYNsa",
                                  // _paymentdata[index]['billid'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "20-05-2020",                                
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                                Text(
                                  "14:30 PM",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )))

        ]),
      ),
    );
  }

/*  Future<void> _loadPaymentHistory() async {
    String urlLoadJobs =
        "https://asaboleh.com/superchef/php/load_paymenthistory.php";
    await http
        .post(urlLoadJobs, body: {"email": widget.user.email}).then((res) {
      print(res.body);
      if (res.body == "nodata") {
        setState(() {
          _paymentdata = null;
          titlecenter = "No Previous Payment";
        });
      } else {
        setState(() {
          var extractdata = json.decode(res.body);
          _paymentdata = extractdata["payment"];
        });
      }
    }).catchError((err) {
      print(err);
    });
  }*/

  loadOrderDetails() {
  /*  Order order = new Order(
        billid: _paymentdata[index]['billid'],
        orderid: _paymentdata[index]['orderid'],
        total: _paymentdata[index]['total'],
        dateorder: _paymentdata[index]['date']);*/

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => OrderDetailScreen(
                 // order: order,
                )));
  }
}

