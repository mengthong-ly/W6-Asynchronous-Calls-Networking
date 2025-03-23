import 'dart:convert';

import 'package:w6_asynchronous_calls_/Exercise-2/model/post.dart';
import 'package:w6_asynchronous_calls_/Exercise-2/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class HttpPostsRepository extends PostRepository {
  final String jsonPlaceHolderUri =
      'https://jsonplaceholder.typicode.com/posts';

  Post fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'], title: json['title'], description: json['body']);
  }

  @override
  Future<List<Post>> getPost() async {
    final request = await http.get(Uri.parse(jsonPlaceHolderUri));
    final jsonParse = jsonDecode(request.body) as List<dynamic>;
    final List<Post> result = jsonParse.map(
      (jsonMap) {
        return fromJson(jsonMap);
      },
    ).toList();

    return result;
  }
}
