import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';



class offer extends StatefulWidget {
  @override
  _offerState createState() => _offerState();
}

class _offerState extends State<offer> {
  final List<String> images = ['img/OF.png','img/sp.png','img/eve.png'];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Offer'),
        elevation: 0,
        backgroundColor: Colors.grey[600],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
        height: 500,
            color:   Colors.white,
            child: PageView(

              children: images.map((image)=>Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover
                  ),
                ),
              )).toList(),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              width: double.infinity,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Royal Offers ",style: TextStyle(
                      color:  Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                  ),),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}