import 'package:domain/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/horizontal_movielist.dart';
import 'components/movieI_tem.dart';

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
        SystemUiOverlayStyle(statusBarColor: Colors.red)
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          body: SingleChildScrollView(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TopImageTitle(movie),
                _movieDescription(),
                SizedBox(
                  height: 200,
                  child: HorizontalMovieList(),
                ),
              ],
            ),
          )
      )
    );
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

  _video() {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
        Card(
              child: InkWell(

                child: Image.network("https://image.tmdb.org/t/p/w342/"+movie.posterPath,
                  fit: BoxFit.cover,
                  height: 200,
                  width:200,
                  alignment: Alignment.center,
                ),
              ),

            ),

            Card(
              child: InkWell(

                child: Image.network("https://image.tmdb.org/t/p/w342/"+movie.posterPath,
                  fit: BoxFit.cover,
                  height: 200,
                  width:200,
                  alignment: Alignment.center,
                ),
              ),

            ),
          ],
        ));
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
            "https://image.tmdb.org/t/p/w342/" + _movie.backdropPath,
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 40,
          top: 150,
          child: Image.network(
            "https://image.tmdb.org/t/p/w342/" + _movie.posterPath,
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
