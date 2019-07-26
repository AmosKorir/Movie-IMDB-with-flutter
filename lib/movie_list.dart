import 'package:flutter/material.dart';

import 'components/movieI_tem.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieList createState() => _MovieList();
}

class _MovieList extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _getMovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text("Loading ...")),
            );
          } else {
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(snapshot.data.length, (index) {
                return new MovieItem(snapshot.data[index]);
              }),
            );
          }
        },
      ),
    );
  }

  _getMovies() {}
}
