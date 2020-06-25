import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'user.dart';

void main() => runApp(PaymentHistoryScreen());

class PaymentHistoryScreen extends StatefulWidget {
  final User user;

  const PaymentHistoryScreen({Key key, this.user}) : super(key: key);
  @override
  _PaymentHistoryScreenState createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  String server = "https://asaboleh.com/superchef";
  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text('Payment History'),
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
            "Payment History",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Card(
            elevation: 10,
            color: Colors.orangeAccent.shade100,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                        height: screenHeight / 8,
                        width: screenWidth / 5,
                        child: Row(children: <Widget>[
                          Text(
                            "Amount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ])),
                    Container(
                        height: screenHeight / 8,
                        width: screenWidth / 5,
                        child: Row(children: <Widget>[
                          Text(
                            "OrderID",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ])),
                    Container(
                        height: screenHeight / 8,
                        width: screenWidth / 5,
                        child: Row(children: <Widget>[
                          Text(
                            "BillID",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ])),
                    Container(
                        height: screenHeight / 8,
                        width: screenWidth / 5,
                        child: Row(children: <Widget>[
                          Text(
                            "Date&Time",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                        ])),
                  ]),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 1, 10, 1),
                  )
                ])),
          )
        ]),
      ),
    );
  }

  void deleteAll() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: new Text(
          'Delete Payment History?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          MaterialButton(
              onPressed: () {
                /*  Navigator.of(context).pop(false);
                http.post("https://asaboleh.com/superchef/php/delete_cart.php",
                    body: {
                     // "email": widget.user.email,
                    }).then((res) {
                  print(res.body);

                  if (res.body == "success") {
                    //_loadCart();
                  } else {
                    Toast.show("Failed", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  }
                }).catchError((err) {
                  print(err);
                });*/
              },
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
}
