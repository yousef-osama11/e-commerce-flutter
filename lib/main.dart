import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const InFitApp());
}

class InFitApp extends StatelessWidget {
  const InFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InFit',
      theme: ThemeData(fontFamily: 'ReadexPro'),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
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