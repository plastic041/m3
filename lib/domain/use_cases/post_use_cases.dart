import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:m3/env.dart';

import '../entities/post.dart';

Future<List<Post>> fetchPost() async {
  Uri uri = Uri.parse("https://planet.moe/api/v1/timelines/public");
  uri.replace(queryParameters: {
    "local": "true",
  });
  final http.Response response = await http.get(uri, headers: {
    'Authorization': 'Bearer $mastodonBearerToken',
  });

  if (response.statusCode == 200) {
    final List<dynamic> postsRaw = jsonDecode(response.body);

    List<Post> posts = postsRaw.map((post) => Post.fromJson(post)).toList();

    return posts;
  } else {
    throw Exception('Failed to load post');
  }
}
