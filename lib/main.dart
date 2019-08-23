import 'package:domain/models/movie.dart';
import 'package:flutter/material.dart';

import 'components/main_drawer.dart';
import 'package:presenters/moviewPresenter.dart';

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
  MoviePresenter moviePresenter=new MoviePresenter();
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(moviePresenter);

  }


class _MyHomePageState extends State<MyHomePage>  {
  MoviePresenter moviePresenter;


  _MyHomePageState(this.moviePresenter);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new MovieList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
