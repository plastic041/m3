import "package:flutter/material.dart";
import 'package:m3/widgets/post_detail.dart';

import '../domain/entities/post.dart';

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "스레드",
        ),
        centerTitle: false,
      ),
      body: PostDetail(
        post: post,
      ),
    );
  }
}
