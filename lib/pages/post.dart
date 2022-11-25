import 'package:flutter/material.dart';
import 'package:m3/widgets/post_list_view.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: const PostListView(),
    );
  }
}
