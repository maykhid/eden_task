import 'package:eden_task/app/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';

class EdenApp extends StatelessWidget {
  const EdenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const AuthScreen(),
    );
  }
}
