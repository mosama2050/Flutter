import 'package:flutter/material.dart';

import 'package:royal/screens/aboutus/layout.dart';


class PageViewPage extends StatelessWidget implements HasLayoutGroup {
  PageViewPage({Key key, this.layoutGroup, this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  Widget _buildPage({int index, Color color , String image , String title , String descr}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Container(padding: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          color: color,
          child: new Image.asset(
    '$image',
            ),
          ),
        Text(
          "$title",
          style: TextStyle(
            color:  color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(padding: EdgeInsets.all(10),),
        Text(
          "$descr  ",
          style: TextStyle(
            color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold ,),textDirection: TextDirection.rtl,textAlign: TextAlign.right,
        )

      ],
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: [
        _buildPage(index: 1, color: Colors.green ,image: 'img/sp.png' ,title:"Page 1" ,descr:"حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),
        _buildPage(index: 2, color: Colors.blue,image: 'img/sp.png' ,title:"Page 2" ,descr:"حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),

        _buildPage(index: 3, color: Colors.indigo,image: 'img/sp.png' ,title:"Page 3" ,descr:"حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),

        _buildPage(index: 4, color: Colors.red,image: 'img/sp.png' ,title:"Page 4" ,descr:"حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير حجات حلوه كتير"),

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

      body: _buildPageView(),
    );
  }
}