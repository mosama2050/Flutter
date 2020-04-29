import 'package:flutter/material.dart';

import 'package:royal/screens/BeautyTextfield.dart';
import 'package:royal/screens/home.dart';
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
  @override
  Widget build(BuildContext context) {
    final NameField = BeautyTextfield(
      width: double.maxFinite,
      height: 60,
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text,
      prefixIcon: Icon(Icons.person),
      placeholder: "Enter Your Name",
      onTap: () {
        print('Click');
      },
      onChanged: (text) {
        setState(() {
          name = text;
        });
      },
      onSubmitted: (data) {
        print(data.length);
      },
    );
    final emailField = BeautyTextfield(
      width: double.maxFinite,
      height: 60,
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text,
      prefixIcon: Icon(Icons.mail),
      placeholder: "Enter Your Email",
      onTap: () {
        print('Click');
      },
      onChanged: (text) {
        setState(() {
          email = text;
        });
      },
      onSubmitted: (data) {
        setState(() {
          print("erererer");
          data.isEmpty ? data = "enter email" : null;
        });
      },
    );
    final passwordField1 = BeautyTextfield(
      width: double.maxFinite,
      height: 60,
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text,
      prefixIcon: Icon(Icons.lock_outline),
      placeholder: "Enter Your Password",

      obscureText: true,
      onTap: () {
        print('Click');
      },
      onChanged: (text) {
        setState(() {
          password = text;
        });
      },
      onSubmitted: (data) {
        print(data.length);
      },
    );
    final Phonenumber = BeautyTextfield(
      width: double.maxFinite,
      height: 60,
      duration: Duration(milliseconds: 300),
      inputType: TextInputType.text,
      prefixIcon: Icon(Icons.phone_iphone),
      placeholder: "Enter Your Phone ",
      onTap: () {
        print('Click');
      },
      onChanged: (text) {
        setState(() {
          phone = text;
        });
      },
      onSubmitted: (data) {
        print(data.length);
      },
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
            MaterialPageRoute(builder: (context) => DashBoard()),
          );
        },
        child: Text("Login",
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
            print(name + email + password + phone);
            dynamic result =
                await _auth.signupwithemail(email, password, name, phone);
            if (result == null) {
              setState(() {
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
        child: Text("Save",
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
                    NameField,
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField1,
                    SizedBox(height: 25.0),
                    Phonenumber,
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
