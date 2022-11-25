import 'package:auto_route/auto_route.dart';

import '../pages/counter.dart';
import '../pages/home.dart';
import '../pages/post_list_view.dart';
import '../pages/fidget.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: CounterPage),
        AutoRoute(page: PostPage),
        AutoRoute(page: FidgetPage),
      ],
    ),
  ],
)
class $AppRouter {}
