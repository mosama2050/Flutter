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
//signInAnonymously
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

  //sgin up with email and pass
  Future signupwithemail (String email , String password ,String name , String phone)async{
    try {
      AuthResult result = await _Auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userfromFirbase(user);

    }  catch (e) {
      print(e.toString());
      return null;
    }
  }


  //sgin in with email and pass
  Future signinwithemail (String email , String password )async{
    try {
      AuthResult result = await _Auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userfromFirbase(user);

    }  catch (e) {
      print(e.toString());
      return null;
    }
  }



  //log out
Future logut() async {
  try {
    return await _Auth.signOut();
  }  catch (e) {
    print(e.toString());
    return null;
  }
}



}