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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/counter.dart' as _i2;
import '../pages/fidget.dart' as _i4;
import '../pages/home.dart' as _i1;
import '../pages/post_list_view.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CounterRoute.name: (routeData) {
      final args = routeData.argsAs<CounterRouteArgs>(
          orElse: () => const CounterRouteArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CounterPage(key: args.key),
      );
    },
    PostRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PostPage(),
      );
    },
    FidgetRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FidgetPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              CounterRoute.name,
              path: 'counter-page',
              parent: HomeRoute.name,
            ),
            _i5.RouteConfig(
              PostRoute.name,
              path: 'post-page',
              parent: HomeRoute.name,
            ),
            _i5.RouteConfig(
              FidgetRoute.name,
              path: 'fidget-page',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i5.PageRouteInfo<CounterRouteArgs> {
  CounterRoute({_i6.Key? key})
      : super(
          CounterRoute.name,
          path: 'counter-page',
          args: CounterRouteArgs(key: key),
        );

  static const String name = 'CounterRoute';
}

class CounterRouteArgs {
  const CounterRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'CounterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.PostPage]
class PostRoute extends _i5.PageRouteInfo<void> {
  const PostRoute()
      : super(
          PostRoute.name,
          path: 'post-page',
        );

  static const String name = 'PostRoute';
}

/// generated route for
/// [_i4.FidgetPage]
class FidgetRoute extends _i5.PageRouteInfo<void> {
  const FidgetRoute()
      : super(
          FidgetRoute.name,
          path: 'fidget-page',
        );

  static const String name = 'FidgetRoute';
}
