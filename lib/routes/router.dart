import 'package:auto_route/auto_route.dart';

import '../pages/counter.dart';
import '../pages/home.dart';
import '../pages/tweet_list_view.dart';
import '../pages/animation.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: CounterPage),
        AutoRoute(page: TweetPage),
        AutoRoute(page: AnimationPage),
      ],
    ),
  ],
)
class $AppRouter {}
