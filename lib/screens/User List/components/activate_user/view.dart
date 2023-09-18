import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neerp/screens/User%20List/components/activate_user/cubit/activate_user_cubit.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class ActivateUserDialog extends StatelessWidget {
  const ActivateUserDialog({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivateUserCubit(context.read<APIService>()),
      child: ActivateDialog(userId: userId),
    );
  }
}

class ActivateDialog extends StatelessWidget {
  const ActivateDialog({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return BlocConsumer<ActivateUserCubit, ActivateUserState>(
      //buildWhen: (previous, current) => previous.userId != current.userId,
      listener: (context, state) {
        if (state.status == ActivateUserStatus.failed) {
          showCupertinoSnackBar(
              context: context, message: "Activation Failed Try Again!");
        } else if (state.status == ActivateUserStatus.success) {
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        context.read<ActivateUserCubit>().userIdChnaged(userId);
        return CupertinoAlertDialog(
          title: TextStyleExample(
            name: 'Confirm?',
            style: textTheme.titleMedium!.copyWith(
              color: CupertinoColors.activeBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextStyleExample(
            name: 'Confirm to activate?',
            style: textTheme.titleSmall!,
          ),
          actions: [
            CupertinoDialogAction(
              child: TextStyleExample(
                name: 'Cancel',
                style: textTheme.labelLarge!,
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            CupertinoDialogAction(
              child: TextStyleExample(
                name: 'Activate',
                style: textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                context.read<ActivateUserCubit>().activateUser();
              },
            ),
          ],
        );
      },
    );
  }
}
