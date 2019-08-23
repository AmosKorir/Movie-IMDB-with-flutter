import 'dart:convert';

import 'package:domain/models/movie.dart';
import 'package:http/http.dart';

class MovieMapper {
  static List<Movie> movietransform(Response response) {
    var jsonData = jsonDecode(response.body);
    var results = jsonData["results"];
    List<Movie> movies = [];
    for (var p in results) {
      print(p);
      movies.add(Movie.fromJson(p));
    }
    return movies;
  }
}
