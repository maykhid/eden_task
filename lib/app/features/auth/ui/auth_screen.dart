import 'package:eden_task/app/features/order/ui/views/screens/order_detail_screen.dart';
import 'package:eden_task/app/shared/ui/app_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Eden',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: Colors.green.shade900,
                ),
              ),
              const Gap(8),
              FaIcon(
                FontAwesomeIcons.leaf,
                size: 60,
                color: Colors.green.shade900,
              ),
            ],
          ),
          const Gap(80),
          const Text('Continue with'),
          const Gap(20),
          AppIconButton(
            text: 'Sign in with Google',
            icon: const FaIcon(FontAwesomeIcons.google, size: 24),
            onPressed: () => context.push(OrderDetailScreen.name),
          ),
          const SizedBox(height: 10),
          const Text('or'),
          const SizedBox(height: 10),
          AppIconButton(
            text: 'Sign in with GitHub',
            icon: const FaIcon(FontAwesomeIcons.github, size: 24),
            onPressed: () => context.push(OrderDetailScreen.name),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
