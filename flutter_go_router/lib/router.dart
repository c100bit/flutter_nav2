import 'package:flutter/material.dart';
import 'package:flutter_nav2/app.dart';
import 'package:flutter_nav2/book_list_screen.dart';
import 'package:flutter_nav2/not_fond_screen.dart';
import 'package:go_router/go_router.dart';

import 'book_detail_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/online',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => App(child: child),
      routes: [
        GoRoute(
          path: '/online',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: BooksListScreen(booksStorage: 'online')),
          routes: [
            GoRoute(
                path: ':id',
                builder: (context, state) =>
                    BookDetailsScreen(id: int.parse(state.params['id']!))),
          ],
        ),
        GoRoute(
          path: '/offline',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: BooksListScreen(booksStorage: 'offline')),
          routes: [
            GoRoute(
                path: ':id',
                builder: (context, state) =>
                    BookDetailsScreen(id: int.parse(state.params['id']!))),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, GoRouterState state) => const NotFoundScreen(),
);
