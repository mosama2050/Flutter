import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royal/model/user.dart';

class databaseServices{

  final String uid;
  databaseServices({this.uid});
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference Ratecollection = Firestore.instance.collection('rate');




  Future updateUserData(String name ,String email ,String pass ,String phone )
  async{
    return await userCollection.document(uid).setData({
      'email' : email,
      'name' : name,
      'pass' : pass,
      'phone' : phone
    });
  }



  Future updateRate(String comment , double rapp , double rclup , double rserv )
  async{
    return await Ratecollection.document(uid).setData({
      'comment' : comment,
      'rateapp' : rapp,
      'rateclup' : rclup,
      'rateservc' : rserv
    });
  }

//users list from snapshot
  List<usermodel> userlistformsnapshot(
      QuerySnapshot snapshot){

  return snapshot.documents.map((doc){
    return usermodel(
      name: doc.data['name']??"",
      email: doc.data['email']??"",
      pass:doc.data['pass']??"",
      phone: doc.data['phone']??"",
    );
  }).toList();
  }

//get user strem
Stream<List<usermodel>> get users {
  return userCollection.snapshots()
  .map(userlistformsnapshot);
}




}