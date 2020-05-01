//import 'package:pro1/UI/Utility/Resources.dart';
//import 'package:pro1/UI/Utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/home2.dart';


class WelcomeScreen extends StatelessWidget {
  List<PageViewModel> page(BuildContext context) {
    return [
      PageViewModel(
        iconColor: Colors.green,
        pageColor: Colors.yellow,
        // bubbleBackgroundColor: Colors.white,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text(
              "Gym",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
            Text(
              "bla bla bla bla ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        mainImage: Image.asset(
          'img/ro.jpg',
           fit: BoxFit.cover,

          width: MediaQuery.of(context).size.width - 60,
          height:MediaQuery.of(context).size.height - 20 ,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(
        iconColor: Colors.black,
        pageColor: Colors.yellow,
        // bubbleBackgroundColor: Colors.white,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text(
              "cafe",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
            Text(
              "string.student_welcome_text",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        mainImage: Image.asset(
         'img/ro.jpg',
           fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width - 60,
          height:MediaQuery.of(context).size.height - 20 ,
          alignment: Alignment.center,
        ),
        textStyle: TextStyle(color: Colors.white),
      ),
      PageViewModel(
        iconColor: Colors.deepOrange,
        pageColor: Colors.yellow,
        // bubbleBackgroundColor: Colors.white,
        title: Container(),
        body: Column(
          children: <Widget>[
            Text(
              "Resturant",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
            Text(
              "string.parent_welcome_text",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        mainImage: Image.asset(
          'img/ro.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width - 60,
          alignment: Alignment.center,
          height:MediaQuery.of(context).size.height - 20 ,
        ),
        textStyle: TextStyle(color: Colors.white),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IntroViewsFlutter(
            page(context),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DashBoard2(),
                      ),
                    );
                  },
                  color: Colors.blue,
                  child: Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
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
              padding: const EdgeInsets.symmetric(vertical:20, horizontal: 10),
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
      ),
    );
  }
}
