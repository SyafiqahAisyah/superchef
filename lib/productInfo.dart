import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:superchef/product.dart';


class ProductInfo extends StatefulWidget {
  final Product product;
  const ProductInfo ({Key key, this.product}) : super(key: key);
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
   double screenHeight, screenWidth;
   @override
    void initState() {
    super.initState();
    
  }

  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: _onBackPressed,
         child: Scaffold(
           backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('My recipe'),
        ),
        body: Container(   
          alignment: Alignment.topCenter,     
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 8),
                  Container(
                    height: screenHeight / 2,                   
                    child: CachedNetworkImage(
                      
                      fit: BoxFit.cover,
                      imageUrl:
                      "http://www.asaboleh.com/superchef/productImages/"

                    ),
                  
              ),
            
                                   
                 ] ),
                                
                                ),
                              ))));
                            }  
                            Future<bool> _onBackPressed() {
                              return showDialog(
                                    context: context,
                                    builder: (context) => new AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                      title: new Text(
                                        'Are you sure?',
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      content: new Text(
                                        'Back to homepage',
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        MaterialButton(
                                            onPressed: () {
                                              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                                            },
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            )),
                                        MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ) ??
                                  false;
                            }                                            
}  
