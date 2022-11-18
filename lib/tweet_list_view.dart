import 'package:flutter/material.dart';
import "tweet_card.dart";

class TweetListView extends StatelessWidget {
  const TweetListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return const TweetCard();
      },
    );
  }
}
