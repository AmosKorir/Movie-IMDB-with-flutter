

import 'Pagination.dart';

import 'movie.dart';

class Page{
  Pagination _pagination;
  List<Movie> _movies;

  Page(this._pagination, this._movies);

  List<Movie> get movies => _movies;

  set movies(List<Movie> value) {
    _movies = value;
  }

  Pagination get pagination => _pagination;

  set pagination(Pagination value) {
    _pagination = value;
  }


}