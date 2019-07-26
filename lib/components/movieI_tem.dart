import 'package:flutter/material.dart';
import 'package:movie_imdb_trailers/models/movie.dart';
import 'package:movie_imdb_trailers/movie_details.dart';

// ignore: must_be_immutable
class MovieItem extends StatefulWidget {
  Movie movie;

  MovieItem(this.movie);

  @override
  _MovieItem createState() => _MovieItem(movie);
}

class _MovieItem extends State<MovieItem> {
  Movie movie;

  _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          onTap: navigateToDetaits(movie),
          child: Image.network(movie.avatar),
        ),
      ),
    );
  }

  navigateToDetaits(Movie movie) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => MovieDetails(movie)));
  }
}
