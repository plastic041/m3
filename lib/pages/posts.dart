import 'package:flutter/material.dart';
import 'package:m3/widgets/post_list_view.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostListView(),
      appBar: AppBar(
        title: Text('Posts'),
      ),
      drawer: Drawer(),
    );
  }
}
