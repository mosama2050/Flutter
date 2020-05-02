import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class ListViewEmployees extends StatefulWidget {

  @override
  _ListViewEmployeesState createState() => new _ListViewEmployeesState();
}

class _ListViewEmployeesState extends State<ListViewEmployees> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Devloped By'),
          centerTitle: true,
          backgroundColor: Colors.black45,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);},),
        ),
        body:ListView(children: <Widget>[  Column(
          children: <Widget>[

            Divider(height: 5.0),
            ListTile(

              title: Text(
                'Mohamed Osama',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              subtitle: Text(
                'Developer',
                style: new TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              ),

              leading:

              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 18.0,
                child: Image(
                  image: AssetImage('img/as.png' ),
                  fit: BoxFit.fill,
                )
              ),

              trailing:    IconButton(
                  icon: const Icon(Icons.mail, color: Colors.redAccent,),
//                              onPressed: () => _deleteEmployee(context, items[position], position)
                  onPressed: () =>    _launchURL('https://www.facebook.com/mohama25/')
              ),


              onTap: () =>    _launchURL('https://www.facebook.com/mohama25/'),
            ),
          ],
        )
          ,Divider(
            color: Colors.black,
            height: 4,
          ),
          Column(
            children: <Widget>[

              Divider(height: 5.0),
              ListTile(

                title: Text(
                  'Eslam Ragab',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                subtitle: Text(
                  'Developer',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                leading:

                CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 18.0,
                    child: Image(
                      image: AssetImage('img/as.png' ),
                      fit: BoxFit.fill,
                    )
                ),

                trailing:    IconButton(
                    icon: const Icon(Icons.mail, color: Colors.redAccent,),
//                              onPressed: () => _deleteEmployee(context, items[position], position)
                    onPressed: () =>    _launchURL('https://www.facebook.com/mohama25/')
                ),


                onTap: () =>    _launchURL('https://www.facebook.com/mohama25/'),
              ),
            ],
          )
          ,Divider(
            color: Colors.black,
            height: 4,
          ),
          Column(
            children: <Widget>[

              Divider(height: 5.0),
              ListTile(

                title: Text(
                  'Mohamed Shawky',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                subtitle: Text(
                  'Developer',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                leading:

                CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 18.0,
                    child: Image(
                      image: AssetImage('img/as.png' ),
                      fit: BoxFit.fill,
                    )
                ),

                trailing:    IconButton(
                    icon: const Icon(Icons.mail, color: Colors.redAccent,),
//                              onPressed: () => _deleteEmployee(context, items[position], position)
                    onPressed: () =>    _launchURL('https://www.facebook.com/mohama25/')
                ),


                onTap: () =>    _launchURL('https://www.facebook.com/mohama25/'),
              ),
            ],
          )
          ,Divider(
            color: Colors.black,
            height: 4,
          ),
          Column(
            children: <Widget>[

              Divider(height: 5.0),
              ListTile(

                title: Text(
                  'Mohamed naser',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                subtitle: Text(
                  'Designer',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                leading:

                CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    radius: 18.0,
                    child: Image(
                      image: AssetImage('img/as.png' ),
                      fit: BoxFit.fill,
                    )
                ),

                trailing:    IconButton(
                    icon: const Icon(Icons.mail, color: Colors.redAccent,),
//                              onPressed: () => _deleteEmployee(context, items[position], position)
                    onPressed: () =>    _launchURL('https://www.facebook.com/mohama25/')
                ),


                onTap: () =>    _launchURL('https://www.facebook.com/mohama25/'),
              ),
            ],
          )
          ,Divider(
            color: Colors.black,
            height: 4,
          ),
        ],)

        )
    );

  }

  _launchURL(String url) async {
    //const url = 'https://www.facebook.com/mohama25/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  }
