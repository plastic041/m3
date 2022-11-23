import "package:flutter/material.dart";

import 'package:m3/pages/tweet_list_view.dart';

class TweetCard extends StatelessWidget {
  const TweetCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              children: const [
                CircleAvatar(
                  radius: 12.0,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Flexible(
                  child: VerticalDivider(
                    thickness: 2,
                    width: 1,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      // user info
                      post.displayName,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      // user info
                      post.acct,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  post.content,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
