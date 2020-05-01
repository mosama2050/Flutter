

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:royal/screens/table/order.dart';

class NestedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return NestedPagestat();
  }
}

class NestedPagestat extends State<NestedPage> {
  @override
  Widget build(BuildContext context) {
//    void showLongToast(String s) { Fluttertoast.showToast(
//        msg: "This is Center Short Toast",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIosWeb: 1,
//        backgroundColor: Colors.red,
//        textColor: Colors.white,
//        fontSize: 16.0
//    );}
    Container buildContainer(int index) {
      return Container(
          child: Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {
                print(index);
                setState(() {


                });

//                Scaffold.of(context).showSnackBar(
//                    SnackBar(content: Text("$index is checed")
//                      ,duration: Duration (seconds:20),
//
//                    ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => order()),
                );
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Image(
                        image: AssetImage("img/r.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "$index",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    }
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        automaticallyImplyLeading: true,
        expandedHeight: 200,
        backgroundColor: Colors.black45,
        floating: true,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            title: Text("Table"),
            background:

                Material(
                    child: InkWell(
              onTap: () {},
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(
                        "img/ro.jpg",
                      ),
                      fit: BoxFit.fill,
                    )),
              ),
            ))),
      ),
      SliverFillRemaining(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: <Widget>[
          buildContainer(1),
          buildContainer(2),
          buildContainer(3),
          buildContainer(4),
          buildContainer(5),
          buildContainer(6),
          buildContainer(7),
          buildContainer(8),
          buildContainer(9),
          buildContainer(10),
          buildContainer(11),
          buildContainer(12),
          buildContainer(13),
          buildContainer(14),
          buildContainer(15),
          buildContainer(16),
          buildContainer(17),
          buildContainer(18),
          buildContainer(19),
          buildContainer(20),
          buildContainer(21),
          buildContainer(22),
          buildContainer(23),
          buildContainer(24),
          buildContainer(25),
          buildContainer(26),
          buildContainer(27),
          buildContainer(28),
          buildContainer(29),
          buildContainer(30),
          buildContainer(31),
          buildContainer(32),
          buildContainer(33),
          buildContainer(34),
          buildContainer(35),
          buildContainer(36),
          buildContainer(37),
          buildContainer(38),
          buildContainer(39),
          buildContainer(40),
          buildContainer(41),
          buildContainer(42),
          buildContainer(43),
          buildContainer(44),
          buildContainer(45),
          buildContainer(46),
          buildContainer(47),
          buildContainer(48),
          buildContainer(49),
          buildContainer(50),
          buildContainer(51),
          buildContainer(52),
          buildContainer(53),
          buildContainer(54),
          buildContainer(55),
          buildContainer(56),
          buildContainer(57),
          buildContainer(58),
          buildContainer(59),
          buildContainer(60),
          buildContainer(61),
          buildContainer(62),
          buildContainer(63),
          buildContainer(54),
          buildContainer(65),
        ],
      ))
    ]));

  }




}
