import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royal/model/OfferModel.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/services/dbservices.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {

  final load = databaseServices();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: StreamBuilder<QuerySnapshot>(
            stream: load.loadevent2(),
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
                          new Image.asset("img/eve.png"),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            offerlist[index].name??"",
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
                                          offerlist[index].image??"img/sp.png"),
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
//                          Container(height: 50,
//                            child: Text(
//                              offerlist[index].desc??"",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.blue[900],
//                                  fontSize: 20.0),
//                            ),
//                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white ,
                              )
                              ,
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Details",
                                style: TextStyle(fontStyle: FontStyle.italic,

                                    color:  Colors.blue[200],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onTap: (){
                             showDialog(
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Details ',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      content: Text(offerlist[index].desc??"vist our Facebook page" , textAlign: TextAlign.right,),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    );
                                  },
                                  context: context,
                                );

                            },
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
