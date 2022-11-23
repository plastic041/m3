import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../widgets/tweet_card.dart';
import 'package:http/http.dart' as http;

class Post {
  final String username;
  final String acct;
  final String displayName;
  final String content;

  const Post({
    required this.username,
    required this.acct,
    required this.displayName,
    required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      username: json['account']['username'],
      acct: json['account']['acct'],
      displayName: json['account']['display_name'],
      content: json['content'],
    );
  }
}

Future<List<Post>> fetchPost() async {
  Uri uri = Uri.parse("https://planet.moe/api/v1/timelines/public");
  final http.Response response = await http.get(uri, headers: {
    'Authorization': 'Bearer ${dotenv.env['MASTODON_BEARER_TOKEN']}',
  });

  if (response.statusCode == 200) {
    final List<dynamic> posts = jsonDecode(response.body);

    return posts.map((dynamic post) => Post.fromJson(post)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}

class TweetPage extends StatefulWidget {
  const TweetPage({super.key});

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return TweetListView(
      futurePosts: futurePost,
    );
  }
}

class TweetListView extends StatelessWidget {
  TweetListView({
    Key? key,
    required this.futurePosts,
  }) : super(key: key);

  final Future<List<Post>> futurePosts;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Scrollbar(
        thickness: 0,
        controller: _scrollController,
        child: FutureBuilder(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                controller: _scrollController,
                separatorBuilder: (context, index) => const Divider(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TweetCard(
                    post: snapshot.data![index],
                  );
                },
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
