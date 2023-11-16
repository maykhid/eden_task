import 'package:eden_task/app/features/auth/ui/cubit/authentication_cubit.dart';
import 'package:eden_task/core/utils/string_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthenticationCubit>().user;

    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl!),
          ),
          const Gap(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi ${user.name!.firstword}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                user.email!,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
