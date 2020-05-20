import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal/model/EventModel.dart';
import 'package:royal/model/OfferModel.dart';
import 'package:royal/model/ads.dart';
import 'package:royal/model/info.dart';
import 'package:royal/model/user.dart';
import 'package:royal/services/auth.dart';

class databaseServices {
  final String uid;
  databaseServices({this.uid});
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  final CollectionReference Ratecollection =
      Firestore.instance.collection('rate');
  final CollectionReference tablecollection =
      Firestore.instance.collection('Tabel');
  final CollectionReference pointcollection =
      Firestore.instance.collection('Points');

  Future updateUserData(
      String name, String email, String pass, String phone) async {
    await pointcollection.document(uid).setData({'Ponits': 10});
    await Ratecollection.document(uid).setData({'comment': "",
      'rateapp': 0,
      'rateclup': 0,
      'rateservc': 0});
    return await userCollection
        .document(uid)
        .setData({'email': email, 'name': name, 'pass': pass, 'phone': phone});
  }

  Future updateRate(
      String comment, double rapp, double rclup, double rserv) async {
    return await Ratecollection.document(uid).setData({
      'comment': comment,
      'rateapp': rapp,
      'rateclup': rclup,
      'rateservc': rserv
    });
  }

  Future updateorder(String pri, String tabel,  String id) async {
    print(pri);

try{
  print("Try");
  await tablecollection.document(tabel).get().then((sn) {
    int p =  sn.data['pri'] ??0 ;
    tablecollection.document(tabel).setData({
      'pri': p+int.parse(pri),
      'tabel': tabel,
      'uid': id,
    });
  });

    }catch(e){
print("cahte");

    tablecollection.document(tabel).setData({
    'pri': int.parse(pri),
    'tabel': tabel,
    'uid': id,
    });

    }






//    await pointcollection.document(id).get().then((sn) {
//      int p =  sn.data['points']  ?? 0;
//      pointcollection.document(id).setData({
//        'points': (p + int.parse(point)),
//      });
//    });
  }

  Future updateorderPT(String pri, String tabel,  String id) async {
    print(pri);



      tablecollection.document(tabel).setData({
        'pri':  int.parse(pri) ,
        'tabel': tabel,
        'uid': id,
      });


  }
  // user profile
  Future<usermodel> getuser() async {
    FirebaseUser s = await FirebaseAuth.instance.currentUser();

    var us = await userCollection.document(s.uid).get();
    var p = await pointcollection.document(s.uid).get();
    print(us.data);
    print(p.data);
    return usermodel(
        name: us.data['name'] ?? " ",
        email: us.data['email'] ?? " ",
        phone: us.data['phone'] ?? " ",
        pass: p.data['Ponits'].toString() ?? "0");
  }

  //table
  Future<String> tableorder(String tableid) async {
    print("==" + tableid);
    var snapshot = await tablecollection.getDocuments();
    //var snapshot = await tablecollection.document(tableid).get();
    FirebaseUser s = await FirebaseAuth.instance.currentUser();
    if (snapshot.documents != null) {
      for (int i = 0; i < snapshot.documents.length ; i++) {
      //  if(snapshot.documents[i]['tabel'].toString().contains("pT")){continue;}
        if (snapshot.documents[i]['uid'] == s.uid &&
            snapshot.documents[i]['tabel'] == tableid) {
          print('your tabel');
          return 'your tabel';
        } else if (snapshot.documents[i]['uid'] == s.uid &&
            snapshot.documents[i]['tabel'].toString().contains("pT")) {
          print('${snapshot.documents[i]['tabel']}YPYPTPTTP');
          return 'your tabel';
        }else if (snapshot.documents[i]['uid'] == s.uid &&
            snapshot.documents[i]['tabel'] != tableid) {
          print('${snapshot.documents[i]['tabel']}You already have a table');
          return 'You already have a table Num : ${snapshot.documents[i]['tabel']}';
        } else if (snapshot.documents[i]['uid'] != s.uid &&
            snapshot.documents[i]['tabel'] == tableid) {
          print('${snapshot.documents[i]['tabel']}Another user\'s table');
          return 'Another user\'s table';
        }
      }
    }

    print('new table');
    return 'new table';
  }

  //load offer b stream
  Stream<QuerySnapshot> loadoffer2() {
    return Firestore.instance.collection('Offers').snapshots();
  }

  Stream<QuerySnapshot> academy() {
    return Firestore.instance.collection('Academy').snapshots();
  }
Stream<QuerySnapshot> gym() {
    return Firestore.instance.collection('Gym').snapshots();
  }Stream<QuerySnapshot> about() {
    return Firestore.instance.collection('Aboutus').snapshots();
  }

  //loadevent b stram
  Stream<QuerySnapshot> loadevent2() {
    return Firestore.instance.collection('Events').snapshots();
  }

  static Future<FirebaseUser> getCurrentFirebaseUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user;
  }

  // load ads
  Stream<QuerySnapshot> getads() {
    return Firestore.instance.collection('Adds').snapshots();
  }

  //
  // load tables
  Stream<QuerySnapshot> gettables() {
    return Firestore.instance.collection('Tabel').snapshots();
  }
}
