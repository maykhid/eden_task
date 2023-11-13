import 'package:eden_task/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EdenApp());
}



class AuthScreen extends StatefulWidget {
  const AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(),
    );
  }
}
