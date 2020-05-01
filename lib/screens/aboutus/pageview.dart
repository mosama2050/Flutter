

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royal/screens/aboutus/layout.dart';

class PageViewPage extends StatelessWidget implements HasLayoutGroup {
  PageViewPage({Key key, this.layoutGroup, this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  Widget _buildPage(
      {int index, Color color, String image, String title, String descr}) {
    return ListView(
      padding: EdgeInsets.only(top: 50, right: 2, left:2, bottom: 10),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "$title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: AlignmentDirectional.center,
              color: color,
//          child: new Image.asset(
//    '$image',
//            ),
              child: FadeInImage.assetNetwork(
                placeholder: 'img/ro.jpg',
                image: '$image',
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
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0) ,bottomRight:  Radius.circular(75.0) ),
              ),
              child: Text(
                "$descr  ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: [
        _buildPage(
            index: 1,
            color: Colors.green,
            image:
                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(1).jpeg?alt=media&token=332e9dcb-e598-438e-ab62-6f615a5e94e3',
            title: "Royal Gym",
            descr:
                "يوجد صاله جيم مجهزه بكل الاجهزه اللازمه ويوجد ايضا فريق اعداد حاصل علي الكثير من البطولات"),
        _buildPage(
            index: 2,
            color: Colors.blue,
            image:
                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(2).jpeg?alt=media&token=444371f8-6709-4e6f-b56c-b285e5cdeeee',
            title: "Page 2",
            descr:
                "حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),
        _buildPage(
            index: 3,
            color: Colors.indigo,
            image:
                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(3).jpeg?alt=media&token=aea6d18c-4faf-42a6-ae35-17a386b12cae',
            title: "Page 3",
            descr:
                "حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),
        _buildPage(
            index: 4,
            color: Colors.red,
            image:
                'https://firebasestorage.googleapis.com/v0/b/royal-79123.appspot.com/o/WhatsApp%20Image%202020-03-23%20at%2010.12.47%20PM%20(5).jpeg?alt=media&token=9d652e10-54bf-4e57-9246-bc5dc06f8830',
            title: "Page 4",
            descr:
                "حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black45,
          title: Text("About US"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("img/r.jpg"), fit: BoxFit.cover)),
          child: _buildPageView(),
        ));
  }
}
