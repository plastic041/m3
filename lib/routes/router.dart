import 'package:auto_route/auto_route.dart';
import 'package:m3/counter.dart';
import 'package:m3/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: CounterPage),
      ],
    ),
  ],
)
class $AppRouter {}
