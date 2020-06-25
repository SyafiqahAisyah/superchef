import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'user.dart';


void main() => runApp(CartScreen());

class CartScreen extends StatefulWidget {
  final User user;

  const CartScreen({Key key, this.user}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String server = "https://asaboleh.com/superchef";
  double screenHeight, screenWidth;
  bool _selfPickup = true;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text('My Cart'),
          actions: <Widget>[
            IconButton(
              icon: Icon(MdiIcons.deleteEmpty),
              onPressed: () {
                deleteAll();
              },
            ),
          ]),
      body: Container(
        child: Column(children: <Widget>[
          Text(
            "Cart content",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Card(
            elevation: 10,
            color: Colors.orangeAccent.shade100,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(children: <Widget>[
                  Column(children: <Widget>[
                    Container(
                        height: screenHeight / 8,
                        width: screenWidth / 5,
                        child:
                            /*ClipOval(
                                            child: CachedNetworkImage(
                                               fit: BoxFit.scaleDown,
                                            imageUrl:
                                              // server+"/productImage/${cartData[index]['id']}.jpg",
                                              placeholder: (context, url) => new CircularProgressIndicator(),
                                           
                                            )
                                          )*/
                            Text(
                          " ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ))
                  ]),
                  Padding(
                      padding: EdgeInsets.fromLTRB(5, 1, 10, 1),
                      child: SizedBox(
                        width: 2,
                        child: Container(
                          height: screenWidth / 3.5,
                          color: Colors.deepOrangeAccent,
                        ),
                      )),
                  Container(
                    width: screenWidth / 1.45,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Column(children: <Widget>[
                          Text("Product :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              )),
                          Text("Available item :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              )),
                          Text("Your Quantity :",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Container(
                              height: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () => {
                                      //  _updateCart(
                                      //    index, "add")
                                    },
                                    child: Icon(MdiIcons.plus,
                                        color: Colors.deepOrangeAccent),
                                  ),
                                  Text(
                                    "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () => {
                                      // _updateCart(index,
                                      //   "remove")
                                    },
                                    child: Icon(
                                      MdiIcons.minus,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                ],
                              )),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Total : RM ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                FlatButton(
                                  onPressed: () => {
                                    //  _deleteCart(index)
                                  },
                                  child: Icon(
                                    MdiIcons.delete,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                              ])
                        ]))
                      ],
                    ),
                  )
                ])),
          ),
          Card(
              elevation: 10,
              color: Colors.orangeAccent.shade100,
              child: Container(
                  width: screenWidth / 1.0,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text("Delivery Option",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text("Weight: " + " KG",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Container(
                      width: screenWidth / 2,
                      child: Column(children: <Widget>[
                        Column(children: <Widget>[
                          Checkbox(
                            checkColor: Colors.black,
                            activeColor: Colors.deepOrangeAccent,
                            value: _selfPickup,
                            onChanged: (bool value) {
                              _onSelfPickUp(value);
                            },
                          ),
                          Text(
                            "Self Pickup",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Checkbox(
                            checkColor: Colors.black,
                            activeColor: Colors.deepOrangeAccent,
                            value: _selfPickup,
                            onChanged: (bool value) {
                              _onSelfPickUp(value);
                            },
                          ),
                          Text(
                            "Delivery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                        FlatButton(
                          color: Colors.deepOrangeAccent,
                          onPressed: () => {_loadMapDialog()},
                          child: Icon(
                            MdiIcons.locationEnter,
                            color: Colors.black,
                          ),
                        ),
                        /*  Text("Current Address:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),*/
                      ]),
                    ),
                  ]))
              /*  child: Padding(
                                                                                                                                              padding: EdgeInsets.all(5),
                                                                                                                                              child: Row(children: <Widget>[
                                                                                                                                                Column(
                                                                                                                                                  children: <Widget>[
                                                                                                                                                    Container(
                                                                                                                                                      height: screenHeight/2 ,
                                                                                                                                                      width: screenWidth / 5,
                                                                                                                  
                                                                                                                                                 ) ])
                                                                                                                  
                                                                                                                                              ])
                                                                                                                                            )*/
              ),
          Card(
              elevation: 10,
              color: Colors.orangeAccent.shade100,
              child: Container(
                  width: screenWidth / 1.0,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text("Payment",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Table(
                          defaultColumnWidth: FlexColumnWidth(1.0),
                          columnWidths: {
                            0: FlexColumnWidth(7),
                            1: FlexColumnWidth(3),
                          },
                          children: [
                            TableRow(children: [
                              TableCell(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 20,
                                    child: Text("Total Item Price ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black))),
                              ),
                              TableCell(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  child: Text("RM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black)),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 20,
                                    child: Text("Delivery Charge ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black))),
                              ),
                              TableCell(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  child: Text("RM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black)),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              TableCell(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 20,
                                    child: Text("Total Amount ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black))),
                              ),
                              TableCell(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 20,
                                  child: Text("RM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black)),
                                ),
                              ),
                            ]),
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minWidth: 200,
                      height: 35,
                      child: Text(
                        'Make Payment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.black,
                      elevation: 10,
                      onPressed:
                       makePayment,
                    ),
                  ])))
        ]),
      ),
    );
  }

  Future<void> makePayment() async {
    /* if (_selfPickup) {
      print("PICKUP");
      Toast.show("Self Pickup", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else if (_homeDelivery) {
      print("HOME DELIVERY");
      Toast.show("Home Delivery", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      Toast.show("Please select delivery option", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
    var now = new DateTime.now();
    var formatter = new DateFormat('ddMMyyyy-');
    String orderid = widget.user.email.substring(0,4) +
        "-" +
        formatter.format(now) +
        randomAlphaNumeric(6);
    print(orderid);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => PaymentScreen(
                /*  user: widget.user,
                  val: _totalprice.toStringAsFixed(2),
                  orderid: orderid,*/
                )));*/
  }

  void deleteAll() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: new Text(
          'Delete all items?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          MaterialButton(
              onPressed: () {},
              child: Text(
                "Yes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              )),
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              )),
        ],
      ),
    );
  }

  void _onSelfPickUp(bool value) {}

  _loadMapDialog() {}
}
