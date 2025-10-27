import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:binayak_pharmacy/features/shell/presentation/shell_scaffold.dart';
import 'package:binayak_pharmacy/features/splash/splash_screen.dart';
import 'package:binayak_pharmacy/features/about/about_screen.dart';
import 'package:binayak_pharmacy/features/auth/login_screen.dart';
import 'package:binayak_pharmacy/features/dashboard/dashboard_screen.dart';
import 'package:binayak_pharmacy/features/medicines/medicines_screen.dart';
import 'package:binayak_pharmacy/features/sales/sales_screen.dart';
import 'package:binayak_pharmacy/features/notifications/notifications_screen.dart';
import 'package:binayak_pharmacy/features/reports/reports_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellScaffold(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/medicines',
            builder: (context, state) => const MedicinesScreen(),
          ),
          GoRoute(
            path: '/sales',
            builder: (context, state) => const SalesScreen(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutScreen(),
      ),
    ],
  );
});