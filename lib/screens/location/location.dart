import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:royal/screens/drower.dart';


class location extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
                child: Text("WEb View " , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , color: Colors.black),),)
//                GoogleMap(
//                  mapType: MapType.hybrid,
//                  initialCameraPosition: _kGooglePlex,
//                  onMapCreated: (GoogleMapController controller) {
//                    _controller.complete(controller);
//                  },
//                ),


              ))
            ])));
  }


}
