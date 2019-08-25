import 'dart:async';

import 'package:data/repositories/MovieApiRepository.dart';
import 'package:data/utils/StreamControllerManager.dart';
import 'package:domain/models/Videos.dart';

class VideoPresenter {
  StreamController streamController;
  VideoPresenterView _view;
  MovieApiRepository movieApiRepository = new MovieApiRepository();

  VideoPresenter();

  setView(VideoPresenterView value) {
    _view = value;
  }

  void getVideos(String id) {
    streamController =
        StreamControllerManager.initStreamContraller(streamController);

    movieApiRepository.getVideo(id)
        .listen((onData) {
      _view.setVideo(onData);
    }, onError: (error) {
      _view.error(error);
    });
  }

  void dispose() {
    if (streamController != null) {
      streamController.close();
    }
  }
}

abstract class VideoPresenterView {
  void setVideo(List<Results> results);

  void error(FallThroughError error);
}
