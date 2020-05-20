import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:royal/model/OfferModel.dart';
import 'package:royal/screens/aboutus/layout.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/services/dbservices.dart';

class Gym extends StatefulWidget {
  @override
  acdmiystateg createState() => acdmiystateg();
}

class acdmiystateg extends State<Gym> {

  final load = databaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/r.jpg"), fit: BoxFit.cover)),
          child: StreamBuilder<QuerySnapshot>(
              stream: load.gym(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<OfferModel> offerlist = [];
                  for (var doc in snapshot.data.documents) {
                    offerlist.add(OfferModel(
                        desc: doc.data['desc'],
                        image: doc.data['image'],
                        name: doc.data['name']));
                  }
                  return PageView.builder(
                    itemBuilder: (context, index) =>
                        ListView(children: <Widget>[Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${offerlist[index].name ?? ""}",
                            style: GoogleFonts.alexBrush(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            alignment: AlignmentDirectional.center,
                             color: Colors.black45,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'img/gym.jpeg',
                              image: '${offerlist[index].image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            // height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(75.0),
                                  bottomRight: Radius.circular(75.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "${offerlist[index].desc ?? ""}  ",
                                style: GoogleFonts.tajawal(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ]),],
                    ),
                    itemCount: offerlist.length,
                  );
                } else {
                  return Loading();
                }
              }),
        ));
  }
}

