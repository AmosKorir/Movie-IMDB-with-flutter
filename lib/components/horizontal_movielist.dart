import 'package:domain/Constants.dart';
import 'package:domain/models/Videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presenters/VideoPresenter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HorizontalMovieList extends StatefulWidget {
  List<Results> moview = [];
  String movieId;

  HorizontalMovieList(this.movieId);

  @override
  State<StatefulWidget> createState() {
    return _MovieList(moview, movieId);
  }
}

class _MovieList extends State<HorizontalMovieList>
    implements VideoPresenterView {
  List<Results> moview = [];
  String _movieId;
  VideoPresenter videoPresenter;

  _MovieList(this.moview, this._movieId);

  @override
  void initState() {
    videoPresenter = new VideoPresenter();
    videoPresenter.setView(this);
    videoPresenter.getVideos(_movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(moview.length, (index) {
          return _movieItem(moview[index]);
        }),
      ),
    );
  }

  Widget _movieItem(Results results) {
    return Card(
      child: InkWell(
        onTap: () {
          _launchYoutube(results.key);
        },
        child: Image.network(
          Constants.YOUTUBE_THUMBNAIL_BASE_URL + results.key + "/hqdefault.jpg",
          fit: BoxFit.cover,
          height: 200,
          width: 200,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  @override
  void error(FallThroughError error) {
    print(error.toString());
  }

  @override
  void setVideo(List<Results> results) {
    setState(() {
      moview = results;
    });
  }
}

_launchYoutube(String key) async {
  String url = Constants.YOUTUBE_BASE_URL + key;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
