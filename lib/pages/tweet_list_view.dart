import 'package:flutter/material.dart';

import '../components/tweet_card.dart';

class TweetPage extends StatelessWidget {
  const TweetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TweetListView();
  }
}

class TweetListView extends StatelessWidget {
  TweetListView({
    Key? key,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: Scrollbar(
        thickness: 0,
        controller: _scrollController,
        child: ListView.separated(
          controller: _scrollController,
          separatorBuilder: (context, index) => const Divider(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const TweetCard();
          },
        ),
      ),
    );
  }
}
