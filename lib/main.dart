import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'config/constants.dart';
import 'di/di.dart';
import 'provider/character_provider.dart';
import 'provider/db_provider.dart';
import 'ui/character_list_widget.dart';
import 'ui/home_widget.dart';

void main() {
  setupDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: mRootWidget,
        builder: (BuildContext context, GoRouterState state) => const HomeWidget(),
        routes: [
          GoRoute(
            path: mCharactersWidget,
            builder: (BuildContext context, GoRouterState state) => const CharacterListWidget(),
          ),
        ],
      ),
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => ErrorWidget(state.error!),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CharacterProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: _router,
      ),
    );
  }
}
