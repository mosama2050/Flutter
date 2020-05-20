import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royal/screens/BeautyTextfield.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/screens/login2.dart';
import 'package:royal/services/auth.dart';

class signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginsate();
}

class loginsate extends State<signup> {
  final AuthServices _auth = AuthServices();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static final formKey = new GlobalKey<FormState>();
  String email = "";
  String password = "";
  String phone = "";
  String name = "";

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
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
          icon: Icon(Icons.email ,color: Colors.white,size: 40,),
          errorStyle: TextStyle(backgroundColor: Colors.white,
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      validator: (value) {
        if (value.length<6) {
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
          icon: Icon(Icons.lock,color: Colors.white,size: 40,),
          errorStyle: TextStyle(backgroundColor: Colors.white,
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final Namefield = TextFormField(
      
      validator: (value) {
        if (value.length<10) {
          return "Name less than 10 char";
        }
      },
      onChanged: (text) {
        setState(() {
          name = text;

        });
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        icon: Icon(Icons.person,color: Colors.white,size: 40,),
          errorStyle: TextStyle(backgroundColor: Colors.white,
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final phonField = TextFormField(
        keyboardType: TextInputType.phone,
        validator: (value) {
          var potentialNumber = int.tryParse(value);
          if (potentialNumber == null) {
            return 'Enter a phone number';
          }
        },
      onChanged: (text) {
        setState(() {
          phone = text;

        });
      },

      style: style,
      decoration: InputDecoration(
          icon: Icon(Icons.phone,color: Colors.white,size: 40,),
          errorStyle: TextStyle(backgroundColor: Colors.white,
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone",
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
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login2()),
          );
        },
        child: Text("Have account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SaveButon = Material(
      elevation: 100.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (formKey.currentState.validate()) {
          setState(() {
            loading=true;
          });
            print(name + email + password + phone);
            dynamic result =
                await _auth.signupwithemail(email, password, name, phone);
            if (result == null) {

              setState(() {
                loading=false;
                _buildErrorDialog(context, "error please try agian");
              });
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashBoard()),
            );

          } else {
            _buildErrorDialog(context, "not vaild");
          }
        },
        child: Text("create",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return loading?Loading():Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/ro.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        child: Text(
                      "Sign Up ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(height: 25.0),
                    Namefield,
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 25.0),
                    phonField,
                    SizedBox(
                      height: 30.0,
                    ),
                    SaveButon,
                    SizedBox(height: 25.0),
                    loginButon,
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
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
            'Error Message',
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
