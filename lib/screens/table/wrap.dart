import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:royal/screens/loading.dart';
import 'package:royal/screens/table/order.dart';
import 'package:royal/screens/table/orderpt.dart';
import 'package:royal/screens/table/table.dart';
import 'package:royal/services/dbservices.dart';

class MyStatefulWidget extends StatelessWidget {
  final String text;
   final String trans ;

  MyStatefulWidget({Key key, @required this.text, @required this.trans}) : super(key: key);
  final serv = databaseServices();
  @override
  Widget build(BuildContext context) {
    print(text);
    return Scaffold(
        body: FutureBuilder<String>(
            future: serv.tableorder(text),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

            if (snapshot.hasData) {
                if (snapshot.data == 'your tabel')
                {if (trans!=""){return orderpt(text,trans);}else{
                  return order(text);}
                }
                else if (snapshot.data  == 'Another user\'s table') {
                 return Center(
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("img/ro.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 30),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 100),
                              child:Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Container(

                                    child: Text("${snapshot.data}" , style: TextStyle(color: Colors.red ,fontSize: 30),),
                                    color: Colors.white,
                                    padding: EdgeInsets.all(10),
                                  )
                                ),
                                SizedBox(height: 40,),
                                Center(
                                child: Material(
                                  elevation: 100.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.deepOrangeAccent,
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width/2,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NestedPage(trans)),
                                      );
                                    },
                                    child: Text("Back",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),],  
                              ),
                            ))
                      ],
                    ),
                  );
               //   return NestedPage('Another user\'s table');
                }
                else if (snapshot.data.substring(0,5) == 'You already have a table'.substring(0,5 )) {
                  return Center(
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("img/ro.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 30),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 100),
                              child:Column(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                      child: Container(

                                        child: Text('${snapshot.data}' , style: TextStyle(color: Colors.red ,fontSize: 30), textAlign: TextAlign.center,),
                                        color: Colors.white,
                                        padding: EdgeInsets.all(10),
                                      )
                                  ),
                                  SizedBox(height: 40,),
                                  Center(
                                    child: Material(
                                      elevation: 100.0,
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.deepOrangeAccent,
                                      child: MaterialButton(
                                        minWidth: MediaQuery.of(context).size.width/2,
                                        padding: EdgeInsets.fromLTRB(
                                            20.0, 15.0, 20.0, 15.0),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NestedPage(trans)),
                                          );
                                        },
                                        child: Text("Back",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),],
                              ),
                            ))
                      ],
                    ),
                  );
                  //   return NestedPage('Another user\'s table');
                }
                else {
                  //(snapshot.data=='new table')
                  if (trans!=""){return orderpt(text,trans);}else{
                    return order(text);}
                }
              } else {
                return Loading();
              }
            }));
  }


}
