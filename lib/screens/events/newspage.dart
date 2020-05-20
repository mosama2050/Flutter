//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:royal/screens/drower.dart';
//
//import 'package:royal/screens/events/card.dart';
//
//class newspage extends StatelessWidget {
//  Size size;
//
//  @override
//  Widget build(BuildContext context) {
//    size = MediaQuery.of(context).size;
//    return MaterialApp(
//        debugShowCheckedModeBanner: false,
//        home: Scaffold(drawer: drower(),
////            appBar: AppBar(
////              backgroundColor: Colors.grey,
////              title: Text("Top News"),
////              leading:IconButton(icon:Icon(Icons.arrow_back) , onPressed: (){Navigator.pop(context);},) ,
////            ),
//            body: CustomScrollView(slivers: <Widget>[
//          SliverAppBar(
//            automaticallyImplyLeading: true,
//            expandedHeight: 150,
//            backgroundColor: Colors.black45,
//            floating: true,
//            pinned: true,
//            flexibleSpace: FlexibleSpaceBar(
//                title: Text("Events"),
//                background: Material(
//                    child: InkWell(
//                  onTap: () {
//
//                  },
//                  child: Container(
//                    child: ClipRRect(
//                        borderRadius: BorderRadius.circular(20.0),
//                        child: Image(
//                          image: AssetImage('img/eve.png'),
//                          fit: BoxFit.cover,
//                        )
//                        //Image.network("http://www.pngmart.com/files/10/Audi-PNG-Clipart.png",fit: BoxFit.cover,),
//                        ),
//                  ),
//                ))),
//          ),
//          SliverFillRemaining(
//              child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                Expanded(child: card()),
//                Text(
//                  "swipe to right get more :) ",
//                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                ),
//                Text(
//                  "and press on photo to get more information :) ",
//                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
//                )
//              ]))
//        ])));
//  }
//}
