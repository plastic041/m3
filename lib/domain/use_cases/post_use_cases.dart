import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import '../entities/post.dart';

Future<List<Post>> fetchPost() async {
  Uri uri = Uri.parse("https://planet.moe/api/v1/timelines/public");
  uri.replace(queryParameters: {
    "local": "true",
  });
  final http.Response response = await http.get(uri, headers: {
    'Authorization': 'Bearer ${dotenv.env['MASTODON_BEARER_TOKEN']}',
  });

  if (response.statusCode == 200) {
    final List<dynamic> postsRaw = jsonDecode(response.body);

    var posts = postsRaw
        .map(
      (dynamic post) => Post.fromJson(post),
    )
        .map((Post post) {
      final document = parse(post.content);
      final String parsedContent = document
          .querySelectorAll('p')
          .map(
            (e) => e.innerHtml,
          )
          .map(
            (e) => e.replaceAll(r"<br>", "\n"),
          )
          .join("\n\n")
          .trim();

      // remove :emoji:s from displayName
      final displayNameWithoutEmoji = post.displayName
          .replaceAll(
            RegExp(r':[^:]+:'),
            '',
          )
          .trim();

      return post.copyWith(
        content: parsedContent,
        displayName: displayNameWithoutEmoji,
      );
    }).toList();

    return posts;
  } else {
    throw Exception('Failed to load post');
  }
}
