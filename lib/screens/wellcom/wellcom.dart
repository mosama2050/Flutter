//import 'package:pro1/UI/Utility/Resources.dart';
//import 'package:pro1/UI/Utility/constants.dart';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:royal/model/ads.dart';
import 'package:royal/model/user.dart';
import 'package:royal/screens/home2.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/services/dbservices.dart';
import 'package:url_launcher/url_launcher.dart';
class WelcomeScreen extends StatelessWidget {
  final load = databaseServices();
  _launchURL(String s) async {

    if (await canLaunch(s)) {
      await launch(s);
    } else {
      throw 'Could not launch $s';
    }
  }
  List<PageViewModel> page(BuildContext context,List<Ads> s) {
    var rng = new Random();
    int x1 = rng.nextInt(s.length);
    int x2 = rng.nextInt(s.length);
    int x3 = rng.nextInt(s.length);
    int x4 = rng.nextInt(s.length);
    int x5 = rng.nextInt(s.length);

    return [
      PageViewModel(

        iconColor: Colors.green,
        pageColor: Color.fromRGBO(79, 110, 52, 11),
        // bubbleBackgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.yellow,
              ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Royal Clup",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500 ,color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color:  Colors.white,
          )
                ,
                padding: EdgeInsets.all(8),
                child: Text(
                  "More info",
                  style: TextStyle(fontStyle: FontStyle.italic,

                      color:  Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: (){
//                print(s[x1].link);
                _launchURL(s[x1].link??'https://www.facebook.com/RoyalClubSC/?rf=273472789685262');
              },
            ),
          ],
        ),
        mainImage: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: new DecorationImage(
                    image: new NetworkImage(
                      '${s[x1].imageUrl}' ),
                    fit: BoxFit.fill))),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(

        iconColor: Colors.green,
        pageColor: Color.fromRGBO(79, 110, 52, 11),
        // bubbleBackgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Royal Clup",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500 ,color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color:  Colors.white ,
                )
                ,
                padding: EdgeInsets.all(8),
                child: Text(
                  "More info",
                  style: TextStyle(fontStyle: FontStyle.italic,

                      color:  Colors.green ,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: (){
//                print(s[x2].link);
                _launchURL(s[x2].link??'https://www.facebook.com/RoyalClubSC/?rf=273472789685262');
              },
            ),
          ],
        ),
        mainImage: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: new DecorationImage(
                    image: new NetworkImage(
                        '${s[x2].imageUrl}' ),
                    fit: BoxFit.fill))),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(

        iconColor: Colors.green,
        pageColor: Color.fromRGBO(79, 110, 52, 11),
        // bubbleBackgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Royal Clup",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500 ,color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color:  Colors.white ,
                )
                ,
                padding: EdgeInsets.all(8),
                child: Text(
                  "More info",
                  style: TextStyle(fontStyle: FontStyle.italic,

                      color:  Colors.green ,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: (){

                _launchURL(s[x3].link??'https://www.facebook.com/RoyalClubSC/?rf=273472789685262');
              },
            ),
          ],
        ),
        mainImage: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: new DecorationImage(
                    image: new NetworkImage(
                        '${s[x3].imageUrl}' ),
                    fit: BoxFit.fill))),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(

        iconColor: Colors.green,
        pageColor: Color.fromRGBO(79, 110, 52, 11),
        // bubbleBackgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Royal Clup",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500 ,color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color:  Colors.white ,
                )
                ,
                padding: EdgeInsets.all(8),
                child: Text(
                  "More info",
                  style: TextStyle(fontStyle: FontStyle.italic,

                      color:  Colors.green ,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: (){

                _launchURL(s[x4].link??'https://www.facebook.com/RoyalClubSC/?rf=273472789685262');
              },
            ),
          ],
        ),
        mainImage: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: new DecorationImage(
                    image: new NetworkImage(
                        '${s[x4].imageUrl}' ),
                    fit: BoxFit.fill))),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(

        iconColor: Colors.green,
        pageColor: Color.fromRGBO(79, 110, 52, 11),
        // bubbleBackgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.yellow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Royal Clup",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500 ,color: Colors.white),
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white ,
                )
                ,
                padding: EdgeInsets.all(8),
                child: Text(
                  "More info",
                  style: TextStyle(fontStyle: FontStyle.italic,

                      color:  Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: (){

                _launchURL(s[x5].link??'https://www.facebook.com/RoyalClubSC/?rf=273472789685262');
              },
            ),
          ],
        ),
        mainImage: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: new DecorationImage(
                    image:

                    new NetworkImage(
                        '${s[x5].imageUrl}' ),
                    fit: BoxFit.fill))),
        textStyle: TextStyle(color: Colors.white),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: load.getads(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Ads> ads = [];
              for (var doc in snapshot.data.documents) {
//                print(doc.data);
                ads.add(
                    Ads(imageUrl: doc.data['image'], link: doc.data['link']));
              }
              return Stack(
                children: <Widget>[
                  IntroViewsFlutter(
                    page(context,ads),
                    onTapDoneButton: null,
                    showNextButton: true,
                    showBackButton: true,
                    skipText: Text(
                      '↠',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    backText: Text(
                      '←',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    nextText: Text(
                      '→',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    showSkipButton: true,
                    doneText: Container(),
                    pageButtonsColor: Color.fromARGB(100, 254, 198, 27),
                    pageButtonTextStyles: new TextStyle(
                      color: Colors.indigo,
                      fontSize: 16.0,
                    ),
                  ),
                  Positioned(
                    bottom: 60.0,
                    width: MediaQuery.of(context).size.width,
                    // left: MediaQuery.of(context).size.width/2 - 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Hero(
                        tag: 'title',
                        transitionOnUserGestures: true,
                        child: MaterialButton(
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width - 100,
                          elevation: 10,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.only(
                          //     // bottomRight: Radius.elliptical(40, 1),
                          //     topRight: Radius.circular(1000),
                          //   ),
                          // ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => DashBoard2(),
                              ),
                            );
                          },
                          color: Colors.yellow,
                          child: Text(
                            "Start",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    width: MediaQuery.of(context).size.width,
                    // left: MediaQuery.of(context).size.width/2 - 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
//                  Text(
//                    "Royal",
//                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500 ,color: Colors.white ),
//                    textAlign: TextAlign.center,
//                  ),
//                  Icon(
//                    Icons.restaurant,
//                    color: Colors.white,
//                    size: 100,
//                  ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Loading();
            }
          }),
    );
  }
}
