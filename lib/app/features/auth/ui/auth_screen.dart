import 'package:eden_task/app/features/auth/ui/cubit/sign_in_cubit.dart';
import 'package:eden_task/app/features/order/ui/views/screens/order_detail_screen.dart';
import 'package:eden_task/app/shared/ui/app_button.dart';
import 'package:eden_task/core/utils/data_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignInCubit>(
        create: (context) => SignInCubit(),
        child: const AuthView(),
      ),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status.isError) {
          toastification.show(
              context: context,
              title: state.message!,
              type: ToastificationType.error,
              autoCloseDuration: const Duration(seconds: 3),
            );
        } else if (state.status.isSuccess) {
          context.push(OrderDetailScreen.name);
        }
      },
      child: Column(
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
            onPressed: () => context.read<SignInCubit>().signInWithGoogle(),
          ),
          const SizedBox(height: 10),
          const Text('or'),
          const SizedBox(height: 10),
          AppIconButton(
            text: 'Sign in with GitHub',
            icon: const FaIcon(FontAwesomeIcons.github, size: 24),
            onPressed: () => context.read<SignInCubit>().signInWithGithub(),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
