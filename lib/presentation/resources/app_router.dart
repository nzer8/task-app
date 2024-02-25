import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/presentation/features/home_screen/home_screen.dart';
import 'package:task/presentation/features/service_screen/services_screen.dart';

abstract class AppRouter {
  static const kHomeView = '/';
  static const kServiceScreen = '/serviceScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/serviceScreen',
        builder: (context, state) => ServicesScreen(),
      ),
    ],
  );
}
