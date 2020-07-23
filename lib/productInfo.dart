import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:superchef/product.dart';

class ProductInfo extends StatefulWidget {
  final Product product;

  const ProductInfo({Key key, this.product}) : super(key: key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  double screenHeight, screenWidth;
  List productdata;
 

  @override
  void initState() {
    super.initState();
    //_loadData();
  }

  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(widget.product.name),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  height: screenHeight / 2,
                  width: screenWidth / 1.1,
                  child: Image(
                    fit: BoxFit.fill,
                    image:NetworkImage(
                        "http://asaboleh.com/superchef/productImage/${widget.product.id}.jpg"),
                   
                  ),
                ),
                SizedBox(height: 6),
                Container(
                    width: screenWidth / 1.2,
                    //height: screenHeight / 2,
                    child: Card(
                      color: Colors.orange[200],
                        elevation: 6,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Table(
                                    defaultColumnWidth: FlexColumnWidth(1.0),
                                    children: [
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 40,
                                              child: Text("ID :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 40,
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 40,
                                              child: Text(
                                                "" + widget.product.id,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 40,
                                              child: Text("Price  :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Column(children: <Widget>[
                                          GestureDetector(
                                            child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 40,
                                                child: Text(
                                                  "RM " + widget.product.price,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                          )
                                        ])),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 40,
                                              child: Text("Quantity  :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ))),
                                        ),
                                        TableCell(
                                            child: Container(
                                          height: 40,
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              child: Text(
                                                "" + widget.product.quantity,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              )),
                                        )),
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 40,
                                              child: Text("Weight  :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ))),
                                        ),
                                        TableCell(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 40,
                                            child: Text(
                                                widget.product.weight + "g",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                )),
                                          ),
                                        )
                                      ]),
                                      TableRow(children: [
                                        TableCell(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              child: Text("Type  :",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ))),
                                        ),
                                        TableCell(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            height: 30,
                                            child: Text(
                                              "" + widget.product.type,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ]),
                                SizedBox(height: 3),
                              ],
                            )))),
              ],
            ),
          ),
        ));
  }
}
