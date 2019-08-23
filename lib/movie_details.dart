import 'package:flutter/material.dart';
import 'package:domain/models/movie.dart';

class MovieDetails extends StatefulWidget {
  Movie movie;

  MovieDetails(this.movie);

  @override
  _MovieDetails createState() => _MovieDetails(movie);
}

class _MovieDetails extends State<MovieDetails> {
  Movie movie;

  _MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //page to created here
    );
  }
}
