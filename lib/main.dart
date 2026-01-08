import 'package:e_commerce_flutter/presentation/navigation/navigationRoutes.dart';
import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(ProviderScope(child: const InFitApp()));
}
final _router = GoRouter(
  routes: $appRoutes,
);

class InFitApp extends StatelessWidget {
  const InFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'InFit',
      theme: ThemeData(fontFamily: 'ReadexPro'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InFit')),
      body: Center(
        child: Text(
          'Welcome to InFit',
          style: AppTextStyle.heading,
        ),
      ),
    );
  }
}
