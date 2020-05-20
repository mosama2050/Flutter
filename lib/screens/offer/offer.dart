import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:royal/model/OfferModel.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/services/dbservices.dart';

class offer extends StatefulWidget {
  @override
  _offerState createState() => _offerState();
}

class _offerState extends State<offer> {
  // final List<String> images = ['img/OF.png', 'img/sp.png', 'img/eve.png'];
  //final List<OfferModel> offers = OfferModel.getoffer();
  final load = databaseServices();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
        backgroundColor: Colors.deepPurple[200],

        body: StreamBuilder<QuerySnapshot>(
            stream: load.loadoffer2(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<OfferModel> offerlist =[];
                for (var doc in snapshot.data.documents) {

                  offerlist.add(OfferModel(
                      date: doc.data['date'],
                      desc: doc.data['desc'],
                      image: doc.data['image'],
                      name: doc.data['name']));
                  print(doc.data['name']);
                }
                return PageView.builder(

                    itemBuilder: (  context,  index) =>
                        Column(
                                  children: <Widget>[
                                    new Image.asset("img/OF.png"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      offerlist[index].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Till:   ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                        Text(
                                         offerlist[index].date??"",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        margin: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            image: new DecorationImage(
                                                image: new NetworkImage(
                                                   offerlist[index].image??"img/OF.png"),
                                                fit: BoxFit.fitWidth)
//                                      image: DecorationImage(
//                                          image: AssetImage('img/OF.png'),
//                                          fit: BoxFit.cover),
                                            ),
//                                    child: FadeInImage.assetNetwork(
//                                      placeholder: 'img/OF.png',
//                                      image: offers[index].image,
//                                      fit: BoxFit.cover,
//                                    ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(height: 50,
                                      child: Text(
                                        offerlist[index].desc??"",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                )



                     ,  itemCount: offerlist.length,);
              } else {
                return Loading();
              }
            }
            )
    );

  }
}
