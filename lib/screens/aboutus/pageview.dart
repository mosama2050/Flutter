import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:royal/model/OfferModel.dart';
import 'package:royal/screens/aboutus/layout.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/services/dbservices.dart';
class PageViewPage extends StatefulWidget {
  @override
  acdmiystateg createState() => acdmiystateg();
}

class acdmiystateg extends State<PageViewPage> {

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
              stream: load.about(),
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
                    itemBuilder: (context, index) => ListView(children: <Widget>[Column(
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
                              placeholder: 'img/ro.jpg',
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
//class PageViewPage extends StatelessWidget implements HasLayoutGroup {
//  PageViewPage({Key key, this.layoutGroup, this.onLayoutToggle})
//      : super(key: key);
//  final LayoutGroup layoutGroup;
//  final VoidCallback onLayoutToggle;
//
//  Widget _buildPage(
//      {int index, Color color, String image, String title, String descr}) {
//    return ListView(
//      padding: EdgeInsets.only(top: 50, right: 2, left: 2, bottom: 10),
//      children: <Widget>[
//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            SizedBox(
//              height: 30,
//            ),
//            Text(
//              "$title",
//              style: GoogleFonts.alexBrush(
//                  color: Colors.white,
//                  fontSize: 50,
//                  fontWeight: FontWeight.bold),
//            ),
//            SizedBox(
//              height: 35,
//            ),
//            Container(
//              padding: EdgeInsets.all(10),
//              alignment: AlignmentDirectional.center,
//              color: color,
//              child: FadeInImage.assetNetwork(
//                placeholder: 'img/ro.jpg',
//                image: '$image',
//                fit: BoxFit.cover,
//              ),
//            ),
//            SizedBox(
//              height: 15,
//            ),
//            Padding(
//              padding: EdgeInsets.all(10),
//            ),
//            Container(
//              padding: EdgeInsets.all(10),
//              // height: 120,
//              decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(75.0),
//                    bottomRight: Radius.circular(75.0)),
//              ),
//              child: Container(
//                padding: EdgeInsets.all(5),
//                child: Text(
//                  "$descr  ",
//                  style: GoogleFonts.tajawal(
//                      color: Colors.black,
//                      fontSize: 20,
//                      fontWeight: FontWeight.bold),
//                  textDirection: TextDirection.rtl,
//                  textAlign: TextAlign.center,
//                ),
//              ),
//            )
//          ],
//        ),
//      ],
//    );
//  }
//
//  Widget _buildPageView() {
//    return PageView(
//      children: [
//        _buildPage(
//            index: 1,
//            color: Colors.green,
//            image:
//                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(1).jpeg?alt=media&token=332e9dcb-e598-438e-ab62-6f615a5e94e3',
//            title: "Royal Gym",
//            descr:
//                "يوجد صاله جيم مجهزه بكل الاجهزه اللازمه ويوجد ايضا فريق اعداد حاصل علي الكثير من البطولات"),
//        _buildPage(
//            index: 2,
//            color: Colors.blue,
//            image:
//                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(2).jpeg?alt=media&token=444371f8-6709-4e6f-b56c-b285e5cdeeee',
//            title: "Page 2",
//            descr:
//                "جميع الاجهزه التي  يعتمد عليها فى سرعه بناء الجسد"),
//        _buildPage(
//            index: 3,
//            color: Colors.indigo,
//            image:
//                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(3).jpeg?alt=media&token=aea6d18c-4faf-42a6-ae35-17a386b12cae',
//            title: "Page 3",
//            descr:
//                "حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),
//        _buildPage(
//            index: 4,
//            color: Colors.red,
//            image:
//                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(5).jpeg?alt=media&token=9d652e10-54bf-4e57-9246-bc5dc06f8830',
//            title: "Page 4",
//            descr:
//                "حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Container(
//      decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage("img/r.jpg"), fit: BoxFit.cover)),
//      child: _buildPageView(),
//    ));
//  }
//}
