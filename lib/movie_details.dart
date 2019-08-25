import 'package:domain/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:domain/Constants.dart';

import 'components/horizontal_movielist.dart';


class MovieDetails extends StatefulWidget {
  final Movie movie;

  MovieDetails(this.movie);

  @override
  _MovieDetails createState() => _MovieDetails(movie);
}

class _MovieDetails extends State<MovieDetails> {
  Movie movie;

  _MovieDetails(this.movie);

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red));
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TopImageTitle(movie),
              _movieTitle(),
              _movieDescription(),
              _trailerTitle(),
              SizedBox(
                height: 200,
                child: HorizontalMovieList(movie.id.toString()),
              ),
            ],
          ),
        )));
  }

  _movieDescription() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Text(
        movie.overview,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  _movieTitle() {
   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(movie.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
    );
  }
  _trailerTitle(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Trailers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
    );
  }
}
//top layout for the movie details

class TopImageTitle extends StatelessWidget {
  final Movie _movie;

  TopImageTitle(this._movie);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red));
    return Stack(
      children: <Widget>[
        Container(
          //give the size to stack
          height: 300,
        ),
        Container(
          child: Image.network(
            Constants.BACKDROP_BASE_URL_780 + _movie.backdropPath,
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 40,
          top: 150,
          child: Image.network(
           Constants.POSTER_BASE_URL_342 + _movie.posterPath,
            width: 100,
          ),
        ),
        Positioned(
            left: 160,
            top: 230,
            child: Text(
              _movie.voteAverage.toString(),
              style: TextStyle(
                fontSize: 25,
              ),
            ))
      ],
    );
  }
}

//movie description
