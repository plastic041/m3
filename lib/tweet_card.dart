import "package:flutter/material.dart";
import 'dart:math';

// getTweetContent
// get randomly "long tweet" or "short tweet"
String getTweetContent() {
  final random = Random();
  final isLongTweet = random.nextBool();
  if (isLongTweet) {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nisl nunc aliquam nisl, eget aliquam nunc nisl eget nisl. Donec auctor, nisl eget ultricies lacinia, nisl nunc aliquam nisl, eget aliquam nunc nisl eget nisl.";
  } else {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
  }
}

class TweetCard extends StatelessWidget {
  const TweetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            width: 48,
            left: 0,
            top: 0,
            bottom: 0,
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 24.0,
                ),
                SizedBox(
                  height: 8.0,
                ),
                VerticalDivider(
                  thickness: 2,
                  width: 1,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 56,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      // user info
                      "Username",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.blue.shade400,
                      size: 16.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Text(
                      // user info
                      "@username",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  // text content
                  getTweetContent(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
