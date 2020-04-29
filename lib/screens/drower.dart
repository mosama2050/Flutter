import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:royal/screens/ShapesPainter.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/profile/profile.dart';
import 'package:royal/screens/table/table.dart';

class drower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          Container(
            color: Colors.black,
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountName: Text("Royal" ,style: TextStyle(fontSize: 30),),
                accountEmail: Text("  Money Back",style: TextStyle(color: Colors.red),),
                //profile image
                currentAccountPicture: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      "img/sp.png",
                      fit: BoxFit.fill,
                    ))),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashBoard()),
            );
            },
            trailing: Icon(Icons.home),
          ),
          Divider(
            color: Colors.black,
            height: 4,
          ),
          ListTile(
            title: Text('Profile'),

            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            },
            trailing: Icon(Icons.person),
          ),
          Divider(
            color: Colors.black,
            height: 4,
          ),
          ListTile(
            title: Text('How to use'),
            onTap: () {Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("حجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبها ")
              ,duration: Duration (seconds:20),

              ));
            },
            trailing: Icon(Icons.help_outline),
          ),
          Divider(
            color: Colors.black,
            height: 4,
          ),
          ListTile(
            title: Text('Offer'),
            onTap: () {},
            trailing: Icon(Icons.free_breakfast),
          ),
          Divider(
            color: Colors.black,
            height: 4,
          ),
          ListTile(
            title: Text('Table'),
            onTap: () {

              {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NestedPage()),
              );}
            },
            trailing: Icon(Icons.airline_seat_legroom_extra),
          ),Divider(
            color: Colors.black,
            height: 4,
          ), ListTile(
            title: Text('About Us'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
//              {Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => login()),
//              );}
            },
            trailing: Icon(Icons.people),
          ),Divider(
            color: Colors.black,
            height: 4,
          ), ListTile(
            title: Text('Location'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
//              {Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => login()),
//              );}
            },
            trailing: Icon(Icons.location_on),
          ),Divider(
            color: Colors.black,
            height: 4,
          ), ListTile(
            title: Text('Log out'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
//              {Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => login()),
//              );}
            },
            trailing: Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}