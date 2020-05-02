import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:royal/screens/Meune/MatList.dart';

import 'package:royal/screens/aboutus/pageview.dart';
import 'package:royal/screens/events/newspage.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/out4page/Gym.dart';
import 'package:royal/screens/out4page/acadimy.dart';
import 'package:royal/screens/out4page/resturant.dart';
import 'package:royal/screens/rate/rate.dart';

class DashBoard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  Center(
                child: Stack(
                  children: [
                    Container(decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("img/sp.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20,top: 100),
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: [
                            createGridItem(0),
                            createGridItem(1),
                            createGridItem(2),
                            createGridItem(3),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
    );

  }

  Widget createGridItem(int position) {
    var color = Colors.white;

    var img = AssetImage("img/ro.jpg");

    var text = "";
    switch (position) {
      case 0:
        color = Colors.cyan;
        img = AssetImage("img/meneee.png");
        text = "Cafe App";
        break;
      case 1:
        color = Colors.pinkAccent;

        text = "Gym";
        img = AssetImage("img/eve.png");
        break;
      case 2:
        color = Colors.orange[300];
        img = AssetImage("img/r.jpg");
        text = "Academy";
        break;
      case 3:
        color = Colors.deepPurple;
        img = AssetImage("img/about.png");
        text = "Resturant";
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
              if (position == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoard()),
                );
              } else if (position == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gym()),
                );
              } else if (position == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => acdmiy()),
                );
              } else if (position == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => resturant()),
                );
              }
            },
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image(
                      image: img,
                      fit: BoxFit.cover,
                    ),
                  ),
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
