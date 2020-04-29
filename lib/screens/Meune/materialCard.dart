
import 'package:flutter/material.dart';
import 'package:royal/model/material.dart';
class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage:  AssetImage(movie.imageUrl),
            ),
            title: Text(movie.title),
            subtitle: Text(movie.genre),
            trailing: Text(movie.year),
          )
        ],
      ),
    );
  }
}