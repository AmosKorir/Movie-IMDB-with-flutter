import 'dart:async';

import 'package:data/repositories/MovieApiRepository.dart';
import 'package:data/utils/StreamControllerManager.dart';
import 'package:domain/models/movie.dart';

class MoviePresenter {
  StreamController streamController;
  MoviePresenterView _moviePresenterView;
  MovieApiRepository movieApiRepository = new MovieApiRepository();

  void setMoviePresenterView(MoviePresenterView view) {
    _moviePresenterView = view;
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
