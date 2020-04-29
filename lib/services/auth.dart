import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal/model/info.dart';


class AuthServices{
  final FirebaseAuth _Auth = FirebaseAuth.instance;

  User _userfromFirbase(FirebaseUser user ){
    return user !=null ? User(uid: user.uid):null;
  }

  Stream<User> get user {
    return _Auth.onAuthStateChanged
    .map(_userfromFirbase);
  }

  Future loginUser() async {
    try {
      AuthResult result = await _Auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }  catch (e) {
      print(e.toString());
    return null;
    }
  }


}