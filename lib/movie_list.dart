import 'package:domain/models/Page.dart';
import 'package:domain/models/Pagination.dart';
import 'package:domain/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:presenters/moviewPresenter.dart';

import 'components/movieI_tem.dart';

class MovieList extends StatefulWidget {
  List<Movie> moview = [];
  String type;
  bool clear = false;


  MovieList( Key key,this.type, this.clear):super(key:key);

  @override
  State<StatefulWidget> createState() {
    
    return InerMovieList(moview,type,clear);
  }


}

class InerMovieList extends State<MovieList> implements MoviePresenterView {
  List<Movie> moview = [];
  MoviePresenter moviePresenter;
  ScrollController _scrollController = new ScrollController();
  Page pager = new Page(new Pagination(1, 2), new List());
  String type = "";
  bool clear = false;

  InerMovieList(this.moview, this.type, this.clear);


  @override
  void initState() {

    moviePresenter = new MoviePresenter();
    moviePresenter.setMoviePresenterView(this);
    moviePresenter.getMovie(pager.pagination.page, type);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (pager.pagination.page <= pager.pagination.totalPages) {
          clear=false;
          moviePresenter.getMovie(pager.pagination.page + 1, type);
        }
      }
    });
    super.initState();
  }
  @override
  void didUpdateWidget(MovieList oldWidget) {
    setState(() {
      moviePresenter.getMovie(pager.pagination.page, type);
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: 2,
      children: List.generate(moview.length + 1, (index) {
        int position = index;
        if (position == moview.length) {
          return _buildProgressIndicator();
        } else {
//          print(index);
          return new MovieItem(moview[index]);
        }
      }),
      controller: _scrollController,
    ));
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }

  @override
  error() {
    // TODO: implement error
    return null;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  setMovie(Page page) {
    setState(() {
      this.pager = page;
      if (this.clear) {
        moview.clear();
      }
      moview.addAll(page.movies);
    });
  }

  void refresh(String type, bool clear) {
    if (this.clear) {
      moview.clear();
    }
    setState(() {
      this.clear=clear;
      pager = new Page(new Pagination(1, 2), new List());
      this.type = type;
    });
  }
}
