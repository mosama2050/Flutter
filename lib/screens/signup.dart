import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:royal/screens/BeautyTextfield.dart';
import 'package:royal/screens/home.dart';

class signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginsate();
}

class loginsate extends State<signup> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final NameField =BeautyTextfield(
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
        print(text);
      },
      onSubmitted: (data) {
        print(data.length);
      },
    );
    final emailField =BeautyTextfield(
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
        print(text);
      },
      onSubmitted: (data) {
        print(data.length);
      },
    );
    final passwordField1 =BeautyTextfield(
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
        print(text);
      },
      onSubmitted: (data) {
        print(data.length);
      },
    );
    final Phonenumber =BeautyTextfield(
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
        print(text);
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
        onPressed: () {},
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(

                      child: Text("Sign Up " ,style: TextStyle(color: Colors.white ,fontSize: 30 , fontWeight: FontWeight.bold),)
                  ),
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
          ],
        ),
      ),
    );
  }
}
