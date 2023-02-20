import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wilearn/authenticate/login.dart';
import 'package:wilearn/authenticate/register.dart';
import 'package:wilearn/pages/homepage.dart';

import 'assets/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wilearn',
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
      initialLocation: '/signin',
      routes: [
        GoRoute(name: RouteNames.signin, path: "/signin", builder: (context, state) => const LoginPage()),
        GoRoute(name: RouteNames.signup, path: "/signup", builder: (context, state) => const RegisterAsUser(),
          routes: [
            GoRoute(path: 'info', builder: (context, state) => const RegisterUserInfo()),
            GoRoute(path: 'credentials', builder: (context, state) => const RegisterUserCredentials()),
          ]
        ),
        GoRoute(name: RouteNames.dashboard, path: "/", builder: (context, state) => const HomePage()),
      ]);
}