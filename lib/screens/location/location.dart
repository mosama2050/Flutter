import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:royal/screens/drower.dart';
import 'package:url_launcher/url_launcher.dart';

class location extends StatelessWidget {

  _launchURL() async {
    const url = 'https://www.google.com/maps/place/%D8%A7%D9%84%D9%86%D8%A7%D8%AF%D9%8A+%D8%A7%D9%84%D9%85%D9%84%D9%83%D9%8A+2%E2%80%AD/@30.372958,30.5211541,15z/data=!4m5!3m4!1s0x0:0xfd038e4517882072!8m2!3d30.3728839!4d30.5134293';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


 // Completer<GoogleMapController> _controller = Completer();

 // static final CameraPosition _kGooglePlex = CameraPosition(
//    target: LatLng(37.42796133580664, -122.085749655962),
//    zoom: 14.4746,
//  );

//  static final CameraPosition _kLake = CameraPosition(
//      bearing: 192.8334901395799,
//      target: LatLng(37.43296265331129, -122.08832357078792),
//      tilt: 59.440717697143555,
//      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            drawer: drower(),
            body: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: true,
                expandedHeight: 200,
                backgroundColor: Colors.black45,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text("Location"),
                    background: Material(
                        child: InkWell(
                      onTap: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => newspage()),
//                        );
                      },
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: AssetImage('img/loc.png'),
                              fit: BoxFit.cover,
                            )
                            //Image.network("http://www.pngmart.com/files/10/Audi-PNG-Clipart.png",fit: BoxFit.cover,),
                            ),
                      ),
                    ))),
              ),
              SliverFillRemaining(child: Center(
                child:Container(color: Colors.yellow,
                child:  InkWell(
                    onTap: () {
                      _launchURL();
                    },
                    child:Image(
                  image: AssetImage('img/locc.png'),
                  fit: BoxFit.cover,
                )),
                  //GoogleMap(
//                  mapType: MapType.hybrid,
//                  initialCameraPosition: _kGooglePlex,
//                  onMapCreated: (GoogleMapController controller) {
//                    _controller.complete(controller);
//                  },
//                ),


              ))
              ) ])));
  }


}
