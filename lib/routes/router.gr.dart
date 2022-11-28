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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i7;

import '../domain/entities/post.dart' as _i8;
import '../pages/fidget.dart' as _i3;
import '../pages/post_detail.dart' as _i5;
import '../pages/posts.dart' as _i4;
import '../pages/tab_navigation.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    TabNavigationRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.TabNavigationPage(),
      );
    },
    PostsRootRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FidgetRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FidgetPage(),
      );
    },
    PostsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PostsPage(),
      );
    },
    PostDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailsRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.PostDetailsPage(
          key: args.key,
          post: args.post,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeftWithFade,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          TabNavigationRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              PostsRootRouter.name,
              path: 'posts',
              parent: TabNavigationRoute.name,
              children: [
                _i6.RouteConfig(
                  PostsRoute.name,
                  path: '',
                  parent: PostsRootRouter.name,
                ),
                _i6.RouteConfig(
                  PostDetailsRoute.name,
                  path: ':post',
                  parent: PostsRootRouter.name,
                ),
              ],
            ),
            _i6.RouteConfig(
              FidgetRouter.name,
              path: 'fidget',
              parent: TabNavigationRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.TabNavigationPage]
class TabNavigationRoute extends _i6.PageRouteInfo<void> {
  const TabNavigationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TabNavigationRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabNavigationRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PostsRootRouter extends _i6.PageRouteInfo<void> {
  const PostsRootRouter({List<_i6.PageRouteInfo>? children})
      : super(
          PostsRootRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'PostsRootRouter';
}

/// generated route for
/// [_i3.FidgetPage]
class FidgetRouter extends _i6.PageRouteInfo<void> {
  const FidgetRouter()
      : super(
          FidgetRouter.name,
          path: 'fidget',
        );

  static const String name = 'FidgetRouter';
}

/// generated route for
/// [_i4.PostsPage]
class PostsRoute extends _i6.PageRouteInfo<void> {
  const PostsRoute()
      : super(
          PostsRoute.name,
          path: '',
        );

  static const String name = 'PostsRoute';
}

/// generated route for
/// [_i5.PostDetailsPage]
class PostDetailsRoute extends _i6.PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    _i7.Key? key,
    required _i8.Post post,
  }) : super(
          PostDetailsRoute.name,
          path: ':post',
          args: PostDetailsRouteArgs(
            key: key,
            post: post,
          ),
        );

  static const String name = 'PostDetailsRoute';
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({
    this.key,
    required this.post,
  });

  final _i7.Key? key;

  final _i8.Post post;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{key: $key, post: $post}';
  }
}
