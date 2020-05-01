import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:royal/screens/home.dart';
import 'package:royal/screens/login.dart';
import 'package:royal/screens/login2.dart';
import 'package:royal/screens/wellcom/wellcom.dart';
import 'package:royal/services/auth.dart';

import 'model/info.dart';

class wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user==null){
      return login2();
    }else{
      return WelcomeScreen();
    }


  }

}