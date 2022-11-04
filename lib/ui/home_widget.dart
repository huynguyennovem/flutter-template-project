import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/constants.dart';
import '../config/utilities.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.go(Utilities.getRoutePath(name: mCharactersWidget));
          },
          child: const Text('List characters'),
        ),
      ),
    );
  }

}
