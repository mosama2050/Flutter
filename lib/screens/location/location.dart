import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:royal/screens/drower.dart';
import 'package:royal/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class location extends StatelessWidget {

  _launchURL() async {
    const url = 'https://www.google.com/maps/place/%D8%A7%D9%84%D9%86%D8%A7%D8%AF%D9%8A+%D8%A7%D9%84%D9%85%D9%84%D9%83%D9%8A+2%E2%80%AD/@30.372958,30.5211541,15z/data=!4m5!3m4!1s0x0:0xfd038e4517882072!8m2!3d30.3728839!4d30.5134293';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: drower(),
            body:
               ListView(children: <Widget>[
                 new Image.asset("img/loc.png" , fit: BoxFit.cover,),
                   SizedBox(height: 10,),
                   Text("  النادي الملكي " , textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 30),),

                 Text("  مجمع رياضي في مدينه السادات  " , textAlign: TextAlign.right, style: TextStyle( fontSize: 20),),
                   Divider(height: 10,),
                 Text("  العنوان: 32897, المنوفية 32897 " , textAlign: TextAlign.right, style: TextStyle( fontSize: 20 ,fontWeight: FontWeight.bold),),
                 Divider(height: 10,),
                 Text("  الهاتف: 01060003733   " , textAlign: TextAlign.right, style: TextStyle( fontSize: 20 ,fontWeight: FontWeight.bold),),

                 Container(color: Colors.yellow,
                  child:  InkWell(
                        onTap: () {
                          _launchURL();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DashBoard ()),
                          );
                        },
                        child:Image(
                      image: AssetImage('img/locc.png'),
                      fit: BoxFit.cover,
                  )),

              ),],
                )),
                  );

  }


}
