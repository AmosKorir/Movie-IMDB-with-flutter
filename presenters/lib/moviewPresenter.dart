import 'dart:async';

import 'package:data/repositories/MovieApiRepository.dart';
import 'package:data/utils/StreamControllerManager.dart';
import 'package:domain/models/movie.dart';
import 'package:domain/models/Post.dart';
import 'package:data/api/post_api.dart';

class MoviePresenter {
  StreamController streamController;
  MoviePresenterView _moviePresenterView;
  MovieApiRepository movieApiRepository = new MovieApiRepository();

  void setMoviePresenterView(MoviePresenterView view) {
    _moviePresenterView = view;
  }
  void getPosts() {
    Stream<List<Post>> postStream = new Stream.fromFuture(PostApi.getPosts());
    postStream.listen((onData) {
      print("data received");
//      mainView.setView(onData);
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      print(error);
    });
  }
  void getMovie() {
    streamController =
        StreamControllerManager.initStreamContraller(streamController);
    Stream<List<Movie>> stream = movieApiRepository.getMovies();
    stream.listen((onData) {
      print("data received");
     _moviePresenterView.setMovie(onData);
    }, onDone: () {
      print("Task Done");
    }, onError: (error) {
      _moviePresenterView.error();
      print(error);
    });
//    streamController.add(disposiable);
  }

  void dispose() {
    if (streamController != null) {
      streamController.close();
    }
  }
}

abstract class MoviePresenterView {
  setMovie(List<Movie> movies);

  error();
}
