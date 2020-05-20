import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royal/screens/BeautyTextfield.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/screens/login2.dart';
import 'package:royal/services/auth.dart';

class forget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginsate();
}

class loginsate extends State<forget> {
  final AuthServices _auth = AuthServices();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static final formKey = new GlobalKey<FormState>();
  String email = "";

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


    bool loading = false;

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => login2()),
          );
        },
        child: Text("back to Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final SaveButon = Material(
      elevation: 100.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()
          async {
            print(email );
            if (formKey.currentState.validate()) {
              setState(() {
                loading=true;
              });
              print(email);
              try {
                await _auth.sendPasswordResetEmail(email);
                _buildErrorDialog(context, "check Your mail");
              }
               catch (e) {
                print(e);
                _buildErrorDialog(context, e.message);
              }


              }

        },
        child: Text("Reset",
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
                          "Reset password ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),


                    SizedBox(height: 50.0),
                    emailField,
                    SizedBox(height: 25.0),

                    SizedBox(height: 50.0),
                   SaveButon,
                    SizedBox(
                      height: 50.0,
                    ),

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
