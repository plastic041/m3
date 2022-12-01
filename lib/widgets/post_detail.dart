import "package:flutter/material.dart";
import 'package:flutter_html/flutter_html.dart';

import '../utils/time_ago.dart';
import '../domain/entities/post.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    Widget html = Html(
      data: post.content,
      style: {
        'html': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
          fontSize: FontSize(16),
          fontWeight: FontWeight.w400,
        ),
        'body': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
        'img': Style(
          display: Display.inline,
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
        'p': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
          display: Display.block,
          fontSize: FontSize(16.0),
          fontWeight: FontWeight.w400,
          textOverflow: TextOverflow.fade,
        ),
        'a': Style(
          color: Colors.blue,
        ),
        'text': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
          display: Display.inline,
          fontSize: FontSize(16.0),
        ),
      },
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            width: 32,
            left: 0,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(
                    post.avatar,
                  ),
                  radius: 16,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        // user info
                        post.displayName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Flexible(
                      child: Text(
                        // user info
                        post.acct,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black38,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(timeAgo(post.createdAt),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
                html,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
