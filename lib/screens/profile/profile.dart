import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:royal/model/info.dart';
import 'package:royal/model/user.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/screens/login2.dart';
import 'package:royal/screens/table/orderpt.dart';
import 'package:royal/screens/table/table.dart';
import 'package:royal/services/auth.dart';
import 'package:royal/services/dbservices.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage> {
  final FocusNode myFocusNode = FocusNode();
  final AuthServices _authServices = AuthServices();
  final load = databaseServices();
String pt ;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: FutureBuilder<usermodel>(
            future: load.getuser(),
            builder: (BuildContext context, AsyncSnapshot<usermodel> snapshot) {
              if (snapshot.hasData) {
                pt =snapshot.data.pass;
                //   print(snapshot.data.name + "ua aaa");
                return Container(
                  color: Colors.white,
                  child: new ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          new Container(
                            height: 250.0,
                            color: Colors.white,
                            child: new Column(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.0, top: 20.0),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new IconButton(
                                          icon: Icon(Icons.arrow_back),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 90.0),
                                          child: new Text('PROFILE',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                  fontFamily:
                                                      'sans-serif-light',
                                                  color: Colors.black)),
                                        )
                                      ],
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: new Stack(
                                      fit: StackFit.loose,
                                      children: <Widget>[
                                        new Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Container(
                                                width: 140.0,
                                                height: 140.0,
                                                decoration: new BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: new DecorationImage(
                                                    image: new ExactAssetImage(
                                                        'img/as.png'),
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 90.0, right: 100.0),
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                // _getCamIcon()
//                                new CircleAvatar(
//                                  backgroundColor: Colors.red,
//                                  radius: 25.0,
//
//                                  child: new Icon(
//                                    Icons.camera_alt,
//                                    color: Colors.white,
//
//                                  ),
//                                )
                                              ],
                                            )),
                                      ]),
                                )
                              ],
                            ),
                          ),
                          new Container(
                            color: Color(0xffFFFFFF),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 25.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Parsonal Information',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            child: new Text(
                                              snapshot.data.name ?? "",
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Email ID',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            child: new Text(
                                                snapshot.data.email ?? ""),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Mobile',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            child: new Text(
                                                snapshot.data.phone ?? ""),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: new Text(
                                                'Your Points',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: new Text(
                                                snapshot.data.pass ?? "",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            flex: 2,
                                          ),
                                        ],
                                      )),
//                          Padding(
//                              padding: EdgeInsets.only(
//                                  left: 25.0, right: 25.0, top: 2.0),
//                              child: new Row(
//                                mainAxisSize: MainAxisSize.max,
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  Flexible(
//                                    child: Padding(
//                                      padding: EdgeInsets.only(right: 10.0),
//                                      child: new TextField(
//                                        decoration: const InputDecoration(
//                                            hintText: "Enter Pin Code"),
//                                        enabled: !_status,
//                                      ),
//                                    ),
//                                    flex: 2,
//                                  ),
//                                  Flexible(
//                                    child: new TextField(
//                                      decoration: const InputDecoration(
//                                          hintText: "Enter State"),
//                                      enabled: !_status,
//                                    ),
//                                    flex: 2,
//                                  ),
//                                ],  q
//                              )),
                                  _getActionButtons( ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text('Loading...'),
                );
              }
              print(snapshot.data.name);
            }));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons( ) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Transfer"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    if (int.parse(pt)>=100){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NestedPage(pt)),
                    );}
                    else{

                      _buildErrorDialog(context, 'You must collect at least 100 points');
                    }


                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("how to use"),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed:
                      () async {

                    _buildErrorDialog(context, "اهلا بك فى النادي الملكى  \n النادي الملكي بيقدم نظام جديد لتسهيل التعامل و حرصا منه على سعادتكم لذلك فقد قمنا بعمل نظام (الكاش باك ) ويسمح للعميل بالحصول على  مشروبات مجانيه مقابل النقاط الحاصل عليها وذلك عن طريق دخول العميل الى الطاوله الخاصه به و شراء ما يريده من مشروبات ثم مع كل فاتوره يتم اضافه العديد من النقاط التي يمكنك ان  تستخدمها في الحصول على مشروبات مجانيه  عند وصل عدد النقاط التي حصلت عليها لاكثر من 100نقطه حينها تستطيع الاستفاده بها");

                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }
  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Royal Message',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(_message , textAlign: TextAlign.right,),
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
  }
}
