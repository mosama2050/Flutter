import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:royal/model/info.dart';

import 'package:royal/screens/aboutus/pageview.dart';

import 'package:royal/screens/home.dart';
import 'package:royal/screens/home2.dart';
import 'package:royal/screens/location/location.dart';
import 'package:royal/screens/login2.dart';
import 'package:royal/screens/offer/offer.dart';
import 'package:royal/screens/profile/profile.dart';
import 'package:royal/screens/table/table.dart';
import 'package:royal/services/auth.dart';

class drower extends StatelessWidget {
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return   StreamProvider<User>.value(
      value: AuthServices().user,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.black,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  accountName: Text(
                    "Royal",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                  accountEmail: Text(
                    "Money Back",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
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
              onTap: () {
                Navigator.push(
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
              onTap: () {
                Navigator.push(
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
              onTap: () {
//              Scaffold.of(context).showSnackBar(
//              SnackBar(content: Text("حجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبهاحجات كتير نوعمه كتبها ")
//              ,duration: Duration (seconds:20),
//
//              ));
                _buildErrorDialog(context,
                    'اهلا بك فى النادي الملكى  \n النادي الملكي بيقدم نظام جديد لتسهيل التعامل و حرصا منه على سعادتكم لذلك فقد قمنا بعمل نظام (الكاش باك ) ويسمح للعميل بالحصول على  مشروبات مجانيه مقابل النقاط الحاصل عليها وذلك عن طريق دخول العميل الى الطاوله الخاصه به و شراء ما يريده من مشروبات ثم مع كل فاتوره يتم اضافه العديد من النقاط التي يمكنك ان  تستخدمها في الحصول على مشروبات مجانيه  عند وصل عدد النقاط التي حصلت عليها لاكثر من 100نقطه حينها تستطيع الاستفاده بها '
                );},
              trailing: Icon(Icons.help_outline),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            ListTile(
              title: Text('Offer'),
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => offer()),
            );
              },
              trailing: Icon(Icons.free_breakfast),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            ListTile(
              title: Text('Table'),
              onTap: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NestedPage(' ')),
                  );
                }
              },
              trailing: Icon(Icons.airline_seat_legroom_extra),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageViewPage()),
                );
              },
              trailing: Icon(Icons.people),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            ListTile(
              title: Text('Location'),
              onTap: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => location()),
                  );
                }
              },
              trailing: Icon(Icons.location_on),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),   ListTile(
              title: Text('Gym&Academy'),
              onTap: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoard2()),
                  );
                }
              },
              trailing: Icon(Icons.accessibility),
            ),
            Divider(
              color: Colors.black,
              height: 4,
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () async {
                await _authServices.logut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => login2()),
                );
              },
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }

  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Help Message',
            style: TextStyle(color: Colors.blue),
          ),
          content: Text(
            _message,
            textAlign: TextAlign.right,
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('close'),
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
