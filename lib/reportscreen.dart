//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'order.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:http/http.dart' as http;

class ReportScreen extends StatefulWidget {
  final Order order;

  const ReportScreen({Key key, this.order}) : super(key: key);
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  //List _orderdetails;
  String server = "https://asaboleh.com/superchef";
  String titlecenter = "Loading order details...";
  double screenHeight, screenWidth;

  @override
  void initState() {
    super.initState();
    //_loadOrderDetails();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Sales Report'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
              child: InkWell(
                  onTap: null,
                  child: Card(
                    color: Colors.orange[200],
                    elevation: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: InkWell(
                                onTap: () => displayImage(),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: server + "/productImage/1003.jpg?",
                                  placeholder: (context, url) =>
                                      new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                )),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /*  Text(
                                  "ID:             1003",
                                  //_orderdetails[index]['id'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),*/
                                Text(
                                  " Berries cake",
                                  // _orderdetails[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  " Dessert" + "\n",
                                  // _orderdetails[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black),
                                ),
                                Text(
                                  "Sold                                     30",
                                  //_orderdetails[index]['price'],
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

  displayImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.orange[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: new Container(
              color: Colors.orange[200],
              height: screenHeight / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: screenWidth / 1.5,
                      width: screenWidth / 1.5,
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: NetworkImage(
                                  server + "/productImage/1003.jpg?")))),
                  Text("Berris Cake",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ));
      },
    );
  }
}
