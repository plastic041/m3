// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../pages/animation.dart' as _i4;
import '../pages/animation_2.dart' as _i5;
import '../pages/animation_3.dart' as _i6;
import '../pages/counter.dart' as _i2;
import '../pages/home.dart' as _i1;
import '../pages/tweet_list_view.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CounterRoute.name: (routeData) {
      final args = routeData.argsAs<CounterRouteArgs>(
          orElse: () => const CounterRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CounterPage(key: args.key),
      );
    },
    TweetRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TweetPage(),
      );
    },
    AnimationRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AnimationPage(),
      );
    },
    Animation2Route.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.Animation2Page(),
      );
    },
    Animation3Route.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.Animation3Page(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              CounterRoute.name,
              path: 'counter-page',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              TweetRoute.name,
              path: 'tweet-page',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              AnimationRoute.name,
              path: 'animation-page',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              Animation2Route.name,
              path: 'animation2-page',
              parent: HomeRoute.name,
            ),
            _i7.RouteConfig(
              Animation3Route.name,
              path: 'animation3-page',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i7.PageRouteInfo<CounterRouteArgs> {
  CounterRoute({_i8.Key? key})
      : super(
          CounterRoute.name,
          path: 'counter-page',
          args: CounterRouteArgs(key: key),
        );

  static const String name = 'CounterRoute';
}

class CounterRouteArgs {
  const CounterRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'CounterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.TweetPage]
class TweetRoute extends _i7.PageRouteInfo<void> {
  const TweetRoute()
      : super(
          TweetRoute.name,
          path: 'tweet-page',
        );

  static const String name = 'TweetRoute';
}

/// generated route for
/// [_i4.AnimationPage]
class AnimationRoute extends _i7.PageRouteInfo<void> {
  const AnimationRoute()
      : super(
          AnimationRoute.name,
          path: 'animation-page',
        );

  static const String name = 'AnimationRoute';
}

/// generated route for
/// [_i5.Animation2Page]
class Animation2Route extends _i7.PageRouteInfo<void> {
  const Animation2Route()
      : super(
          Animation2Route.name,
          path: 'animation2-page',
        );

  static const String name = 'Animation2Route';
}

/// generated route for
/// [_i6.Animation3Page]
class Animation3Route extends _i7.PageRouteInfo<void> {
  const Animation3Route()
      : super(
          Animation3Route.name,
          path: 'animation3-page',
        );

  static const String name = 'Animation3Route';
}
