
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'package:royal/model/cold.dart';
import 'package:royal/model/hot.dart';
import 'package:royal/model/material.dart';
import 'package:royal/model/sweet.dart';
import 'package:royal/screens/Meune/materialCard.dart';


class MoviesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoviesPageState();
  }
}

class _MoviesPageState extends State<MoviesPage> {
  final List<Movie> movies = hotList.gethot();
  final List<Movie> moviess = coldList.getcold();
  final List<Movie> moviesss = sweetList.getsweet();
  Widget _buildMoviesList() {
    return Container(
      child: movies.length > 0
          ? ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (DismissDirection direction) {
              setState(() {
                // movies.add(moviess.removeAt(index));

              });
            },
            secondaryBackground: Container(
              child: Center(
                child: Text(
                  'Like it',
                  style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.yellowAccent,
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
                // movies.add(moviess.removeAt(index));

              });
            },
            secondaryBackground: Container(
              child: Center(
                child: Text(
                  'Like it',
                  style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.yellowAccent,
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
                // movies.add(moviess.removeAt(index));

              });
            },
            secondaryBackground: Container(
              child: Center(
                child: Text(
                  'Like it',
                  style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),
                ),
              ),
              color: Colors.yellowAccent,
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



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "m",
        home: DefaultTabController(
            length: 3,
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
                         // class name
                      ],
                    ),
                  ),
                ])))));
  }
}
