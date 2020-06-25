import 'package:flutter/material.dart';
import 'package:superchef/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:email_validator/email_validator.dart';

void main() => runApp(RegisterScreen());

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool emailcheck = false;
  bool validateMobile = false;
  String phoneErrorMessage;

  double screenHeight;
  bool _isChecked = false;
  GlobalKey<FormState> _key = new GlobalKey();
  String urlRegister = "https://asaboleh.com/superchef/php/register_user.php";
  TextEditingController _nameEditingController = new TextEditingController();
  TextEditingController _emailEditingController = new TextEditingController();
  TextEditingController _passwordEditingController = new TextEditingController();
  TextEditingController _phoneEditingController = new TextEditingController();
  //bool _validate = false;
  String name, email, password, phone;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
   
   return  Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              upperHalf(context),
              lowerHalf(context),
              
            ],
          ));
    
  }

  Widget upperHalf(BuildContext context) {
    return Container(
      height: screenHeight / 2,
      child: Image.asset(
        'assets/images/login.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget lowerHalf(BuildContext context) {
    return Container(
      color:Colors.orangeAccent.shade400,
      height: 600,
      margin: EdgeInsets.only(top: screenHeight / 2.8),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Card(
            color:Colors.orangeAccent.shade100,
            elevation: 10,
            key: _key,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Register ",
                      style: TextStyle(
                       color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                 
                  TextField(
                      controller:  _nameEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',

                        icon: Icon(Icons.person,color: Colors.orange[900]),
                      )),
                  
                  TextField(
                      controller:  _emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',

                        icon: Icon(Icons.email,color: Colors.orange[900]),          
                      )),
                 
                  TextField(
                    controller:  _passwordEditingController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                       helperText: '*Password must contain at least 8 character',
                       
                      icon: Icon(Icons.lock, color: Colors.orange[900]),
                    ),
                    obscureText: true,
                  ),
                  
                   TextField(
                      controller: _phoneEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        icon: Icon(Icons.phone,color:  Colors.orange[900]),
                      )),
                  
                  SizedBox(
                    height: 5,
                  ),
                
                
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool value) {
                          _onChange(value);
                        },
                      ),
                      GestureDetector(
                        onTap: _showEULA,
                        child: Text('I Agree to Terms',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        minWidth: 120,
                        height: 50,
                        child: Text('Register',
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                        color: Colors.orange[900],
                        textColor: Colors.black,
                        elevation: 8,
                        onPressed: _onRegister
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already have an account? ", style: TextStyle(fontSize: 16.0)),
              GestureDetector(
                onTap: _loginScreen,
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  /*void _confirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirmation"),
          content: new Container(
            height: 20,
            child: Column(
              children: <Widget>[
                Text("Continue registration?"),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Yes"),
              onPressed: _onRegister
            ),
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/

  void _onRegister() {
  /*  showDialog(
      context: context,
      builder: (BuildContext context) {
       
        return AlertDialog(
          title: new Text("Confirm?"),
          content: new Text("Continue registration"),
          actions: <Widget>[
            
            new FlatButton(
              child: new Text("Yes"),
          onPressed: () {
            Navigator.push(context,
          MaterialPageRoute(
            builder: (BuildContext context) => 
            LoginScreen()));
          }),

           new FlatButton(
                  child: new Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });*/

    String name = _nameEditingController.text;
    String email = _emailEditingController.text;
    String password = _passwordEditingController.text;
    String phone = _phoneEditingController.text;

    emailcheck = EmailValidator.validate(email);
    validateMobile(String phone) {
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(pattern);
      if (phone.length == 0) {
        phoneErrorMessage = 'Please enter mobile number';
        return false;
      } else if (!regExp.hasMatch(phone)) {
        phoneErrorMessage = 'Please enter valid mobile number';
        return false;
      }
      return true;
    }

    if (name.length == 0) {
      Toast.show("Please Enter Your Name", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (email.length == 0) {
      Toast.show("Please Enter Your Email", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (emailcheck == false) {
      Toast.show("Invalid Email Format", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (password.length == 0) {
      Toast.show("Please Enter Your Password", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      return;
    } else if (validateMobile(phone) == false) {
      Toast.show(phoneErrorMessage, context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

    return;

    } else if (!_isChecked) {
      Toast.show("Please Accept Term", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }

    http.post(urlRegister, body: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    }).then((res) {
      print(res.body);
      if (res.body == "success") {
        Navigator.pop(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()));
        Toast.show("Registration failed", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        Toast.show("Registration success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }).catchError((err) {
      print(err);
    });
  } 
  

  void _loginScreen() {
    Navigator.pop(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  void _onChange(bool value) {
    setState(() {
      _isChecked = value;
      //savepref(value);
    });
  }

  void _showEULA() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("End-User License Agreement of SuperChef"),
          content: new Container(
            height: 300,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: new SingleChildScrollView(
                    child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              //fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                            text:
                                "This End-User License Agreement is a legal agreement between you and asaboleh This EULA agreement governs your acquisition and use of our SuperChef software (Software) directly from asaboleh or indirectly through asaboleh authorized reseller or distributor (a Reseller).Please read this EULA agreement carefully before completing the installation process and using the SuperChef software. It provides a license to use the SuperChef software and contains warranty information and liability disclaimers. If you register for a free trial of the SuperChef software, this EULA agreement will also govern that trial. By clicking accept or installing and/or using the SuperChef software, you are confirming your acceptance of the Software and agreeing to become bound by the terms of this EULA agreement. If you are entering into this EULA agreement on behalf of a company or other legal entity, you represent that you have the authority to bind such entity and its affiliates to these terms and conditions. If you do not have such authority or if you do not agree with the terms and conditions of this EULA agreement, do not install or use the Software, and you must not accept this EULA agreement.This EULA agreement shall apply only to the Software supplied by asaboleh herewith regardless of whether other software is referred to or described herein. The terms also apply to any asaboleh updates, supplements, Internet-based services, and support services for the Software, unless other terms accompany those items on delivery. If so, those terms apply. This EULA was created by EULA Template for SuperChef. asaboleh shall at all times retain ownership of the Software as originally downloaded by you and all subsequent downloads of the Software by you. The Software (and the copyright, and other intellectual property rights of whatever nature in the Software, including any modifications made there to) are and shall remain the property of asaboleh. asaboleh reserves the right to grant licences to use the Software to third parties.",
                            //children: getSpan(),
                            )),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
               child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

/*String validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}
String validateMobile(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Mobile is Required";
  } else if (value.length < 10) {
    return "Mobile number must be at least 10 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Mobile Number must be digits";
  }
  return null;
}
String validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Email is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid Email";
  } else {
    return null;
  }
}
String validatePass(String value) {
  String patttern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Password is Required";
  } else if (value.length < 6) {
    return "Password must be at least 8 alphanumerics";
  } else if (!regExp.hasMatch(value)) {
    return "Password must contain at least an alphabet and a digit";
  }
  return null;*/

 
  
  
