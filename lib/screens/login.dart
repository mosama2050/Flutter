import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal/screens/BeautyTextfield.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
import 'package:royal/services/auth.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginsate();
}

class loginsate extends State<login> {
  final AuthServices _auth = AuthServices();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static final formKey = new GlobalKey<FormState>();

  Widget hintText() {
    return new Container(
        //height: 80.0,

        child: new Text("",
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center));
  }

  @override
  Widget build(BuildContext context) {
    final emailField = BeautyTextfield(
      width: double.maxFinite,
      height: 60,
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text,
      prefixIcon: Icon(Icons.person),
      placeholder: "Enter Your Email",
      onTap: () {
        print('Click');
      },
      onChanged: (text) {
        text.isEmpty ? 'Email can\'t be empty.' : null;
      },
      onSubmitted: (data) {
        print(data.length);
        //  _email = data;
      },
    );
    final passwordField1 = BeautyTextfield(
      width: double.maxFinite,
      height: 60,
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text,
      prefixIcon: Icon(Icons.lock_outline),
      placeholder: "Enter Your Password",
      onTap: () {
        print('Click');
      },
      onChanged: (text) {
        text.isEmpty ? 'pass can\'t be empty.' : null;
      },
      onSubmitted: (data) {
        print(data.length);
        //     _password = data;
      },
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
      dynamic r=    await _auth.loginUser();
      if(r==null){
        print("error Siging in");
      //  _buildErrorDialog(context, r.toString());
      }else {
        print("Signed in");

        print(r);
      }
        }
//          Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(builder: (context) => DashBoard()),
//          );
        ,
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
//          Navigator.pushReplacement(
//            context,
//            MaterialPageRoute(builder: (context) => signup()),
//          );

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
                          passwordField1,
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
                            onPressed: () => print("Forget"),
                          )
                        ],
                      ),
                      hintText(),
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
          title: Text('Error Message'),
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
