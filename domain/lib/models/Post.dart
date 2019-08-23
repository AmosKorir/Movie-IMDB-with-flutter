import 'dart:convert';
class Post {

  String avatar;


  Post(this.avatar);

  factory Post.fromJson(Map<dynamic, dynamic> json) {
   return new Post(json["avatar"]);
}

}
