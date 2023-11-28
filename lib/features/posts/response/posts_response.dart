import 'dart:convert';

import 'package:democallapi/features/posts/models/post_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsResponse {
  static Future<List<PostDataUIModel>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUIModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUIModel post =
            PostDataUIModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();
    try {
      var response = await client.post(
          Uri.parse(
            'https://jsonplaceholder.typicode.com/posts',
          ),
          body: {
            "title": "Minh Nhan",
            "body": "I'm Minh Nhan and I learn BLoC",
            "userId": "54"
          });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
      ;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
