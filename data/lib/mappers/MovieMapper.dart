import 'dart:convert';

import 'package:domain/models/movie.dart';
import 'package:http/http.dart';
import 'package:domain/models/Videos.dart';
import 'package:domain/models/Pagination.dart';
import 'package:domain/models/Page.dart';

class MovieMapper {
  static Page movietransform(Response response) {
    var jsonData = jsonDecode(response.body);
    var results = jsonData["results"];
    var totalPages=jsonData["total_pages"];
    var currentPage=jsonData["page"];
    List<Movie> movies = [];
    for (var p in results) {
      print(p);
      movies.add(Movie.fromJson(p));
    }

    Pagination pagination=new Pagination(currentPage,totalPages);
    Page page=new Page(pagination,movies);
    return page;
  }

  static List<Results>videotranform(Response response) {
    var jsonData = jsonDecode(response.body);
    return Videos.fromJson(jsonData).results;
  }
}
