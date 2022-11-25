import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../pages/fidget.dart';
import '../pages/tab_navigation.dart';
import '../pages/post_detail.dart';
import '../pages/post.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: TabNavigationPage,
      initial: true,
      children: [
        AutoRoute(
          page: EmptyRouterPage,
          path: 'post',
          name: 'PostRouter',
          children: [
            AutoRoute(
              page: PostPage,
              path: '',
            ),
            AutoRoute(
              page: PostDetailsPage,
              path: ':post',
            ),
          ],
        ),
        AutoRoute(
          page: FidgetPage,
          path: 'fidget',
          name: 'FidgetRouter',
        ),
      ],
    ),
  ],
)
class $AppRouter {}
