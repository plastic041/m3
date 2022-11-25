import 'package:flutter/material.dart';

import '../domain/entities/post.dart';
import '../domain/use_cases/post_use_cases.dart';
import '../widgets/post_card.dart';

class PostListView extends StatefulWidget {
  const PostListView({
    Key? key,
  }) : super(key: key);

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  late Future<List<Post>> futurePosts;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPost();
  }

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
              return RefreshIndicator(
                onRefresh: () async {
                  List<Post> posts = await fetchPost();
                  List<Post> newPosts = <Post>{...posts, ...snapshot.data!}
                      .toList()
                      .sublist(0, 20);

                  setState(() {
                    futurePosts = Future.value(newPosts);
                  });
                },
                child: ListView.separated(
                  controller: _scrollController,
                  separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PostCard(
                      post: snapshot.data![index],
                    );
                  },
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
