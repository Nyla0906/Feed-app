import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mircos/common/storage/route_paths.dart';
import 'package:mircos/features/presentation/pages/feed/feed_screen.dart';
import 'package:mircos/common/common_pages/error_page.dart';
import 'package:mircos/features/presentation/pages/detail/detail_page.dart';
import 'package:mircos/features/presentation/pages/main/main_screen.dart';
import 'package:mircos/features/presentation/pages/favourites/favourite_page.dart';

class Routing {
  static late final GoRouter router;
  static final Routing _instance = Routing._internal();

  static Routing get instance => _instance;

  factory Routing() {
    return _instance;
  }

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  Routing._internal() {
    final routes = <RouteBase>[
      GoRoute(
          path: RoutePaths.home,
          builder: (_, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutePaths.feedScreen,
        builder: (_, state) => const FeedScreen(),
      ),
      GoRoute(
        path: RoutePaths.detailScreen,
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>;
          return DetailScreen(
            title: data["title"] ?? "",
            description: data["description"] ?? "",
            imageData: data["imageUrl"] ?? "",
            date: data["date"] ?? "",
          );
        },
      ),
      GoRoute(
        path: RoutePaths.favouriteScreen,
        builder: (_, state) => const FavouritePage(),
      ),
    ];

    router = GoRouter(
      initialLocation: RoutePaths.home,
      routes: routes,
      errorPageBuilder: (context, state) =>
          const MaterialPage(child: ErrorPage()),
    );
  }
}
