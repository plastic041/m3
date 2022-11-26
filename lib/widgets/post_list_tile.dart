import 'package:auto_route/auto_route.dart';
import "package:flutter/material.dart";

import '../routes/router.gr.dart';
import '../utils/time_ago.dart';
import '../domain/entities/post.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          PostDetailsRoute(
            post: post,
          ),
        );
      },
      child: Padding(
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
                  const SizedBox(
                    height: 4,
                  ),
                  const Flexible(
                    child: VerticalDivider(
                      thickness: 2,
                      width: 1,
                      color: Colors.black38,
                    ),
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
                      Text(
                        timeAgo(post.createdAt),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  Text(
                    post.content,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}