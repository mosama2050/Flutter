import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:royal/screens/BeautyTextfield.dart';
import 'package:royal/screens/forgetpass.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/signup.dart';

import 'package:royal/services/auth.dart';

class login2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginsate();
}

class loginsate extends State<login2> {
  final AuthServices _auth = AuthServices();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static final formKey = new GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      validator: (value) {
        if (!EmailValidator.validate(value)) {
          return "Please enter a valid email";
        }
      },
      onChanged: (text) {
        setState(() {
          email = text;
          email.trim();
        });
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          errorStyle: TextStyle(
              backgroundColor: Colors.white,
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      validator: (value) {
        if (value.length < 6) {
          return "password less than 6 char";
        }
      },
      onChanged: (text) {
        setState(() {
          password = text;
          password.trim();
        });
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          errorStyle: TextStyle(
              backgroundColor: Colors.white,
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          print(email + password);
          if (formKey.currentState.validate()) {
            print(email + password);
            dynamic r = await _auth.signinwithemail(email, password);
            if (r == null) {
              setState(() {
                _buildErrorDialog(context, "  wrong Email or password");
              });
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashBoard()),
              );
            }
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final forgetButon = Material(
      elevation: 100.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.deepOrangeAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => signup()),
          );
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/ro.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      child: Text(
                    "Royal",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico'),
                    textAlign: TextAlign.left,
                  )),
                  Text(
                    "We would likle To Jion us ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      emailField,
                      SizedBox(height: 25.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          passwordField,
                          FlatButton(
                            child: Text(
                              "Forget password..?",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            padding: EdgeInsets.all(10),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forget()),
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButon,
                      SizedBox(height: 25.0),
                      forgetButon,
                      SizedBox(
                        height: 25.0,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Royal Message',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}
