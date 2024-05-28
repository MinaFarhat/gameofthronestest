import 'package:flutter/material.dart';
import 'package:gameofthrones/app_router.dart';

void main() {
  runApp(GameOfThrones(appRouter: AppRouter()));
}

class GameOfThrones extends StatelessWidget {
  final AppRouter appRouter;

  const GameOfThrones({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutes,
    );
  }
}
