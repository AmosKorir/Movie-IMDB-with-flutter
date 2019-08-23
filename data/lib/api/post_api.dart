import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:domain/models/Post.dart';

class PostApi {
  //future method to get post
  static Future<List<Post>> getPosts() async {
    var response = await http.get("https://mapenzi.herokuapp.com/post/all");
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');

    var jsonData = jsonDecode(response.body);

    List<Post> postData = [];

    for (var p in jsonData) {
      print(p);
      Post post = Post.fromJson(p);

      postData.add(post);
    }
    print(postData.length);
    return postData;
  }
}
