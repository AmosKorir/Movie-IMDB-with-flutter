import 'package:domain/models/Videos.dart';
import 'package:http/http.dart' as http;
import 'package:domain/Constants.dart';

import 'package:http/http.dart';


class MovieApi{

  //future method to get the movies
  static Future<Response> getMovies(int page,String type) async{
    var response=await http.get("https://api.themoviedb.org/3/movie/"+type+"?api_key=9f2d1932fd0da11c8531131d1789109e&language=en-US&page="+page.toString());
    return response;
  }

  static Future<Response> getVideo(String id) async {
    var response=await http.get("https://api.themoviedb.org/3/movie/"+id+"/videos?api_key=9f2d1932fd0da11c8531131d1789109e&language=en-US&page=1");
    return response;
  }
}