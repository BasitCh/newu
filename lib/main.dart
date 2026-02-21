import 'package:flutter/material.dart';
import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewU Breathing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF630068)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(child: Text('NewU Breathing App setup complete!')),
      ),
    );
  }
}
