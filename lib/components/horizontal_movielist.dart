import 'package:domain/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presenters/moviewPresenter.dart';

import 'movieI_tem.dart';

class HorizontalMovieList extends StatefulWidget {
  List<Movie> moview = [];

  @override
  _MovieList createState() => _MovieList(moview);
}

class _MovieList extends State<HorizontalMovieList>
    implements MoviePresenterView {
  List<Movie> moview = [];
  MoviePresenter moviePresenter;

  _MovieList(this.moview);

  @override
  void initState() {
    super.initState();
    moviePresenter = new MoviePresenter();
    moviePresenter.setMoviePresenterView(this);
    moviePresenter.getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(moview.length, (index) {
          return _ovieItem(moview[index]);
        }),
      ),
    );
  }

  @override
  error() {
    // TODO: implement error
    return null;
  }

  @override
  setMovie(List<Movie> movies) {
    setState(() {
      moview = movies;
    });
  }

  Widget _ovieItem(Movie movie) {
    return Card(
      child: InkWell(
        child: Image.network(
          "https://image.tmdb.org/t/p/w342/" + movie.posterPath,
          fit: BoxFit.cover,
          height: 200,
          width: 200,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
