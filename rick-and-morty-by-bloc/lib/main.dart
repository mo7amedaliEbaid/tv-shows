import 'package:breakingbad/router.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MortyApp(appRouter: AppRouter(),));
}

class MortyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MortyApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

