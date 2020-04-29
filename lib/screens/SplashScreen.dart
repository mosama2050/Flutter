import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/Constant/Constant.dart';
 //import 'package:royal/screens/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:royal/model/info.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/login.dart';
import 'package:royal/wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => wrapper()),
          );
   // Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
//    FutureBuilder<FirebaseUser>(
//      future: Provider.of<AuthService>(context).getUser(),
//      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
//        if (snapshot.connectionState == ConnectionState.done) {
//          // log error to console
//          if (snapshot.error != null) {
//            print("error");
//            return Text(snapshot.error.toString());
//          }
//
//          // redirect to the proper page DashBoard(snapshot.data) : login();
//          return snapshot.hasData ? DashBoard() : login();
//        } else {
//          // show loading indicator
//          return LoadingCircle();
//        }
//      },
//    );


  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(backgroundColor: Colors.white,
      body: Stack(

        fit: StackFit.expand,
        children: <Widget>[

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'img/sp.png',
                width: animation.value * 400,
                height: animation.value * 400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
