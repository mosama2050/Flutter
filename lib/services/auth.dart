import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal/model/info.dart';
import 'package:royal/screens/table/order.dart';
import 'package:royal/services/dbservices.dart';


class AuthServices{
  String id ;
  final FirebaseAuth _Auth = FirebaseAuth.instance;

  User _userfromFirbase(FirebaseUser user ){
    return user !=null ? User(uid: user.uid):null;
  }

  Stream<User> get user {
    return _Auth.onAuthStateChanged
    .map(_userfromFirbase);
  }
//reset password
  Future<void> sendPasswordResetEmail(String email) async {
    return _Auth.sendPasswordResetEmail(email: email);
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
      id =user.uid;
      // create colletion users
     await databaseServices(uid: user.uid).updateUserData(name, email, password, phone);
    print(name + email + password + phone );
      return _userfromFirbase(user);

    }  catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future Rate(String comment , double rapp , double rclup , double rserv )async{
    try {

      final FirebaseUser user = await _Auth.currentUser();

      // create colletion users
      await databaseServices(uid: user.uid).updateRate(comment, rapp, rclup, rserv);



    }  catch (e) {
      print(e.toString());
      return null;
    }
  }

  // order
  Future order(String pri , String taple   )async{
    try {

      final FirebaseUser user = await _Auth.currentUser();

      // create colletion users
      await databaseServices(uid: user.uid).updateorder(pri, taple,   user.uid);



    }  catch (e) {
      print(e.toString());
      return null;
    }
  }// order
  Future orderPT(String pri , String taple   )async{
    try {

      final FirebaseUser user = await _Auth.currentUser();

      // create colletion users
      await databaseServices(uid: user.uid).updateorderPT(pri, taple,   user.uid);



    }  catch (e) {
      print(e.toString());
      return null;
    }
  }

//
  Future profile( )async{
    try {

       final FirebaseUser user = await _Auth.currentUser();

      // create colletion users
      await databaseServices(uid: user.uid).getuser();



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