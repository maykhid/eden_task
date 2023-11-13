import 'package:eden_task/app/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdenApp extends StatelessWidget {
  const EdenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodySmall: GoogleFonts.oswald(textStyle: textTheme.bodySmall),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const AuthScreen(),
    );
  }
}
