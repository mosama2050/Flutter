
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royal/model/info.dart';
import 'package:royal/screens/SplashScreen.dart';
import 'package:royal/screens/login.dart';
import 'package:royal/Constant/Constant.dart';
import 'package:royal/services/auth.dart';
 
main() =>runApp(Mypp());
class Mypp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthServices().user,
      child:MaterialApp
        (

        title: 'Fluter Profile Page',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Colors.black,

          primaryColorDark:Colors.black,),
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          //SPLASH_SCREEN: (BuildContext context) => new MapScreen(),
          // PROFILE: (BuildContext context) => new ProfilePage(),
          LOGIN_SCREEN: (BuildContext context) => new login(),

          //CARD : (BuildContext context) => new card(),
        },
      ),
    );
    
  
  }
  
}

 