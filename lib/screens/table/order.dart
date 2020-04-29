import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'package:royal/model/cold.dart';
import 'package:royal/model/hot.dart';
import 'package:royal/model/material.dart';
import 'package:royal/model/sweet.dart';
import 'package:royal/screens/Meune/materialCard.dart';

class order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviesPageState();
  }
}

class _MoviesPageState extends State<order> {
  int counter = 0;
  int price = 0;
  double discount = 0;
  final List<Movie> movies = hotList.gethot();
  final List<Movie> moviess = coldList.getcold();
  final List<Movie> moviesss = sweetList.getsweet();
  final List<Movie> moviessssss=[] ;
  Widget _buildMoviesList() {
    return Container(
      child: movies.length > 0
          ? ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      moviessssss.add(movies[index]);
                      counter++;
                      price+=int.parse(movies[index].year);
                      discount+=(int.parse(movies[index].year)+(int.parse(movies[index].year)*.14)).floor();

                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.green,
                  ),
                  dragStartBehavior: DragStartBehavior.down,
                  background: Container(),
                  child: MovieCard(movie: movies[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('Empty')),
    );
  }

  Widget _buildMoviesList2() {
    return Container(
      child: moviess.length > 0
          ? ListView.builder(
              itemCount: moviess.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      moviessssss.add(moviess[index]);
                      counter++;
                      price+=int.parse(moviess[index].year);
                      discount+=(int.parse(moviess[index].year)+(int.parse(moviess[index].year)*.14)).floor();

                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.green,
                  ),
                  dragStartBehavior: DragStartBehavior.down,
                  background: Container(),
                  child: MovieCard(movie: moviess[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('Empty')),
    );
  }

  Widget _buildMoviesList3() {
    return Container(
      child: moviesss.length > 0
          ? ListView.builder(
              itemCount: moviesss.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      moviessssss.add(moviesss[index]);
                      counter++;
                      price+=int.parse(moviesss[index].year);
                      discount+=(int.parse(moviesss[index].year)+(int.parse(moviesss[index].year)*.14)).floor();

                    });
                  },
                  secondaryBackground: Container(
                    child: Center(
                      child: Text(
                        'order',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.green,
                  ),
                  dragStartBehavior: DragStartBehavior.down,
                  background: Container(),
                  child: MovieCard(movie: moviesss[index]),
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                );
              },
            )
          : Center(child: Text('Empty')),
    );
  }

  Widget _buildMoviesList4() {
    return Container(
      child: moviessssss.length > 0
          ? ListView.builder(
        itemCount: moviessssss.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (DismissDirection direction) {
              setState(() {


                  price-=int.parse(moviessssss[index].year);
                  discount-=(int.parse(moviessssss[index].year)+(int.parse(moviessssss[index].year)*.14)).floor();

                moviessssss.removeAt(index);
                counter--;
              });
            },
            secondaryBackground: Container(
              child: Center(
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.red,
            ),
            dragStartBehavior: DragStartBehavior.down,
            background: Container(),
            child: MovieCard(movie: moviessssss[index]),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
          );
        },
      )
          : Center(child: Text('No item')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "m",
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  backgroundColor: Colors.black45,
                  title: Text("Menue"),
                ),
                body: SafeArea(
                    child: Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                TableRow(children: [
                                  Text(
                                    "Number ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "$counter",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(
                                    "price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "$price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  Text(
                                    "Price&Tax",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "$discount  LE",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ]),
                        ),
                        Container(alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 10),
                          child:  IconButton(splashColor: Colors.green,
                            hoverColor: Colors.green,
                            icon: Icon(Icons.done ,size: 50,)
                            ,padding: EdgeInsets.all(10),
                          color: Colors.blue,
                            onPressed: (){
                              _buildErrorDialog(context, "جاري تنفيذ طلبك");
                            },
                        ))
                      ]),
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: TabBar(
                      labelColor: Colors.black,

                      unselectedLabelColor: Colors.lightBlue[100],

                      indicatorWeight: 2,
                      indicatorColor: Colors.blue[100],
                      tabs: [
                        Tab(
                          icon: Icon(Icons.whatshot),
                          text: 'HOT',
                        ),
                        Tab(
                          icon: Icon(Icons.style),
                          text: 'cold',
                        ),
                        Tab(
                          icon: Icon(Icons.trip_origin),
                          text: 'SWEET',
                        ),
                        Tab(
                          icon: Icon(Icons.clear , color: Colors.red,),
                          text: 'delete',


                        )
                      ], // list of tabs
                    ),
                  ),
                  //TabBarView(children: [ImageList(),])
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildMoviesList(),
                        _buildMoviesList2(),
                        _buildMoviesList3(),
                        _buildMoviesList4(),
                        // class name
                      ],
                    ),
                  ),
                ])))));
  }
  Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(
            'تم الطلب ',
            style: TextStyle(color: Colors.blue),
            textAlign: TextAlign.right,
          ),
          content: Text(_message,textAlign: TextAlign.right,),
          actions: <Widget>[
            FlatButton(
                child: Icon(Icons.clear),
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
