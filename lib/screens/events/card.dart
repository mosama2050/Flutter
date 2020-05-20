//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//import 'package:royal/model/EventModel.dart';
//import 'package:royal/model/OfferModel.dart';
//import 'package:royal/screens/events/matchcard.dart';
//import 'package:royal/screens/events/newspage.dart';
//import 'package:royal/screens/events/showmodelbtuttoncustom.dart';
//import 'package:royal/screens/loading.dart';
//import 'package:royal/services/dbservices.dart';
//
//class card extends StatefulWidget {
//  @override
//  cardstate createState() => cardstate();
//}
//
//class cardstate extends State<card> {
//  List<Widget> cardlist = List();
//  List<EventModel> card = List();
//
//
//  void _removecard(index) {
//    setState(() {
//      if (index == 0) {
//        print("last");
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => newspage()),
//        );
//      }
//      card.removeAt(index);
//      cardlist.removeLast();
//    });
//  }
//
//  int len = 10;
//  final load = databaseServices();
//  List<EventModel> eventlist = [];
// List<EventModel> meth(){
//
//   StreamBuilder<QuerySnapshot>(
//       stream: load.loadoffer2(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//
//           for (var doc in snapshot.data.documents) {
//             eventlist.add(EventModel(
//                 date: doc.data['date'],
//                 desc: doc.data['desc'],
//                 image: doc.data['image'],
//                 name: doc.data['name']));
//             print(doc.data['name']);
//           }}});
//   return eventlist;
// }
//  @override
//  Widget build(BuildContext context) {
//    // cardlist.clear();
//
//
//          meth().asMap().forEach((index, c) {
//              cardlist.add(ConstrainedBox(
//                constraints:
//                BoxConstraints(minWidth: 100, minHeight: 100, maxHeight: 400),
//                child: Container(
//                  child: Draggable(
//                      onDragEnd: (details) {
//                        if (details.offset.dx > 150 ||
//                            details.offset.dx < -150) {
//                          _removecard(index);
//                        }
//                      },
//                      child: Container(
//                        // main card container
//                        decoration: BoxDecoration(
//                            shape: BoxShape.rectangle,
//                            borderRadius: BorderRadius.all(Radius.circular(20)),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Color.fromARGB(255, 231, 234, 238),
//                                  spreadRadius: 2,
//                                  blurRadius: 5)
//                            ]),
//                        child: GestureDetector(
//                          onTap: () {
//                            _showcarddetaile(context, c);
//                          },
//                          child: ClipRRect(
//                            borderRadius: BorderRadius.circular(10),
//                            child: Container(
//                              width: MediaQuery
//                                  .of(context)
//                                  .size
//                                  .width - 40,
//                              color: Colors.white,
//                              child: ListView(
//
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.all(10.0),
//                                    child: Column(
//                                      children: <Widget>[
//                                        Text(
//                                          c.name,
//                                          style: TextStyle(
//                                              color: Colors.black87,
//                                              fontSize: 30,
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                        Text(
//                                          c.date,
//                                          style: TextStyle(
//                                              color: Colors.lightGreen,
//                                              fontSize: 25,
//                                              fontWeight: FontWeight.w400),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
//                                  //   Image.network(
//                                  FadeInImage.assetNetwork(
//                                    placeholder: 'img/eve.png',
//                                    image: c.image,
//                                    fit: BoxFit.fill,
//
//
////                            c.imgsrc,
////                            fit: BoxFit.fill,
////
////                            height: 250,
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.only(
//                                        left: 10, bottom: 20, right: 10),
//                                    child: Row(
//                                      mainAxisAlignment: MainAxisAlignment
//                                          .spaceBetween,
//                                      children: <Widget>[
//                                        Row(
//                                          children: <Widget>[
//                                            Text(
//                                              "press to more info ",
//                                              style: TextStyle(
//                                                  fontSize: 20,
//                                                  color: Colors.black,
//                                                  fontWeight: FontWeight.w800),
//                                            ),
//
//                                          ],
//                                        ),
//                                        Row(
//                                          children: <Widget>[
//                                            Icon(Icons.info),
//
//                                          ],
//                                        )
//                                      ],
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                      feedback: Container(
//                        //draging
//                        width: MediaQuery
//                            .of(context)
//                            .size
//                            .width - 40,
//                        height: 500,
//                        child: ClipRRect(
//                          borderRadius: BorderRadius.circular(10),
//                          child: Container(
//                            width: MediaQuery
//                                .of(context)
//                                .size
//                                .width - 40,
//                            color: Colors.white,
//                            child: Image.network(
//                              c.image,
//                              fit: BoxFit.contain,
//                            ),
//                          ),
//                        ),
//                      )),
//                ),
//              ));
//            });
//
//
//          return Center(
//            child: Stack(
//              children: cardlist,
//            ),
//          );
//
//  }
//
//
//  void _showcarddetaile(context, EventModel aa) {
//    showModalBottomSheetcustom(
//        context: context,
//        builder: (BuildContext bc) {
//          return Container(
//            child: SingleChildScrollView(
//              child: Padding(
//                padding: const EdgeInsets.all(10),
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            decoration: BoxDecoration(
//                                shape: BoxShape.circle, color: Colors.white),
//                            child: IconButton(
//                              icon: Icon(Icons.close, size: 35,),
//                              color: Colors.black,
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                            ),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(10.0),
//                            child: Column(
//                              children: <Widget>[
//                                Text(
//                                  aa.name,
//                                  style: TextStyle(
//                                      color: Colors.black87,
//                                      fontSize: 30,
//                                      fontWeight: FontWeight.bold),
//                                ),
//                                Text(
//                                  aa.date,
//                                  style: TextStyle(
//                                      color: Colors.lightGreen,
//                                      fontSize: 25,
//                                      fontWeight: FontWeight.w400),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Icon(
//                                Icons.not_interested,
//                                color: Colors.red,
//                              ),
//                              Icon(Icons.bookmark_border, color: Colors.green)
//                            ],
//                          )
//                        ],
//                      ),
//                    ),
//                    Image.network(
//                      aa.image,
//                      fit: BoxFit.contain,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(10.0),
//                      child: Text(aa.desc),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: SizedBox(
//                        width: double.infinity,
//                        height: 40,
//                        child: ClipRRect(
//                          borderRadius: BorderRadius.circular(10),
//                          child: RaisedButton.icon(
//                            onPressed: () {},
//                            color: Colors.blueGrey,
//                            label: Text(
//                              "Go To The Web page",
//                              style: TextStyle(
//                                color: Colors.white,
//                              ),
//
//                            ),
//                            icon: Icon(Icons.settings_ethernet,
//                              color: Colors.deepOrangeAccent,
//                              textDirection: TextDirection.rtl,),
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//          );
//        });
//  }
//}