import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:royal/screens/Meune/MatList.dart';

import 'package:royal/screens/ShapesPainter.dart';

import 'package:royal/screens/aboutus/pageview.dart';
import 'package:royal/screens/by/by.dart';
import 'package:royal/screens/drower.dart';
import 'package:royal/screens/events/event.dart';
import 'package:royal/screens/events/newspage.dart';
import 'package:royal/screens/location/location.dart';
import 'package:royal/screens/rate/rate.dart';
import 'package:royal/screens/table/table.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatelessWidget {

  //final FirebaseUser currentUser;

  //DashBoard(this.currentUser);


  Size size;
  _launchURL() async {
    const url = 'https://www.facebook.com/RoyalClubSC/?rf=273472789685262';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        drawer: drower(),
        body:CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: true,
            expandedHeight: 200,
            backgroundColor: Colors.black45,
            floating: true,
            pinned: true,
             
            flexibleSpace: FlexibleSpaceBar(
               title: Text("Home"),

              background:
                Material(
                    child: InkWell(
                      onTap: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newspage ()),
                      );
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage.assetNetwork(
                          placeholder: 'img/OF.png',
                          image: 'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/OFFER-arabic-(1).png?alt=media&token=22969023-f7b6-4f1f-ae25-7ded754d1f8f',
                        fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                )


            ),
          ),SliverFillRemaining(
           hasScrollBody: true,
            child:Center(
              child: Stack(
                children: [
                  Container(
                    child: CustomPaint(
                      painter: ShapesPainter(),
                      child: Container(
                        height: size.height / 2,
                        // color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: [
                          createGridItem(0),
                          createGridItem(1),
                          createGridItem(2),
                          createGridItem(3),
                          createGridItem(4),
                          createGridItem(5),

                          createGridItem(6),
                          createGridItem(7),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        ),

      ),
    );
  }

  Widget createGridItem(int position) {
    var color = Colors.white;

    var img = AssetImage("img/ro.jpg");

    var text = "";
    switch (position) {
      case 0:

        color = Colors.cyan;
        img=  AssetImage("img/meneee.png");
        text = "Menu";
        break;
      case 1:
        color = Colors.pinkAccent;

        text = "Event";
        img=  AssetImage("img/eve.png");
        break;
      case 2:
        color = Colors.orange[300];
        img=  AssetImage("img/r.jpg");
        text = "Table";
        break;
      case 3:
        color = Colors.deepPurple;
        img=  AssetImage("img/about.png");
        text = "About Us";
        break;
      case 4:
        color = Colors.blue[900];
        img=  AssetImage("img/f.png" );
        text = "FaceBook";
        break;
      case 5:
        color = Colors.green[600];
        img=  AssetImage("img/ro.jpg");
        text = "Location";
        break;
      case 6:
        color = Colors.orange[300];
        img=  AssetImage("img/ro.jpg");
        text = "Rate Us";
        break;
      case 7:
        color =  Colors.cyan;
        img=  AssetImage("img/menu-1.png");
        text = "Designed by";
        break;

    }

    return Builder(builder: (context) {
      return Padding(
        padding:
        const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
        child: Card(
          elevation: 10,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
            onTap: () {

              if (position == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageViewPage()),
                );
              }else if(position == 6){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }else if(position == 0){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoviesPage ()),
                );
              }else if(position == 1){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newspage ()),
                );
              }else if(position == 2){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NestedPage ()),
                );
              }
              else if(position == 5){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => location ()),
                );

              }
              else if(position == 4){

                _launchURL();
              }
              else if(position == 7){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewEmployees ()),
                );
              }
           },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Image(
                     image: img,
                      fit: BoxFit.cover,

                  ),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "$text",
                      style: TextStyle(color: Colors.white, fontSize: 20),

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

    });

  }
}
