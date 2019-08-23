import 'package:domain/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:presenters/moviewPresenter.dart';

import 'components/movieI_tem.dart';

class MovieList extends StatefulWidget {
  List<Movie> moview = [];

  @override
  _MovieList createState() => _MovieList(moview);
}

class _MovieList extends State<MovieList> implements MoviePresenterView {
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
        child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(moview.length, (index) {
        return new MovieItem(moview[index]);
      }),
    ));
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
}
