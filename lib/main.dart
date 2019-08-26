import 'package:flutter/material.dart';
import 'package:presenters/moviewPresenter.dart';

import 'components/main_drawer.dart';
import 'movie_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie IMDB',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Movie IMDB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  MoviePresenter moviePresenter = new MoviePresenter();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(moviePresenter);
}

class _MyHomePageState extends State<MyHomePage> implements DrawerOptoin {
  GlobalKey<InerMovieList> globalKey=new GlobalKey();

  MoviePresenter moviePresenter;
  String type = "top_rated";
  bool clear = false;

  _MyHomePageState(this.moviePresenter);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(this),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void drawerOption(int code) {
    setState(() {
      clear = true;
      switch (code) {
        case 1:
          type = "popular";

          break;
        case 2:
          type = "top_rated";
          break;
        case 3:
          type = "upcoming";
          break;
        case 4:
          break;
        case 5:
          break;
        case 6:
          type="latest";
          break;
      }
      globalKey.currentState.refresh(type, clear);
    });
  }

  _getList() {
      MovieList movieList= new MovieList(globalKey,type, clear);
      return movieList;
  }
}
