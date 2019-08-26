import 'dart:async';

class StreamControllerManager {

  static StreamController initStreamContraller(
      StreamController streamController) {
    if (streamController == null) {
      return new StreamController();
    }
    return streamController;
  }
}
