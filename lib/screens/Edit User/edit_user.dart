// ignore_for_file: library_private_types_in_public_api, unused_field, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neerp/models/user_list/user_response_model.dart';
import 'package:neerp/screens/Edit%20User/cubit/edit_user_cubit.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({required this.user, super.key});

  final Result user;

  static Route<void> route(user) {
    return CupertinoPageRoute<void>(builder: (_) => EditUserScreen(user: user));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => EditUserCubit(context.read<APIService>())
            ..fullNameChanged(user.fullName!)
            ..emailChanged(user.email!)
            ..phoneChanged(user.phone!)
            ..userIdChanged(user.id!),
          child: EditUser(user: user),
        ),
      ),
    );
  }
}

class EditUser extends StatelessWidget {
  const EditUser({required this.user, super.key});
  final Result user;
  @override
  Widget build(BuildContext context) {
    // final custId =
    //     context.select((AuthBlocBloc bloc) => bloc.state.customer.parentId);

    return BlocListener<EditUserCubit, EditUserState>(
      listener: (context, state) {
        if (state.status == EditUserStatus.error) {
          showCupertinoSnackBar(context: context, message: state.errorResponse);
        } else if (state.status == EditUserStatus.success) {
          Navigator.pop(context);
        }
      },
      child: CustomScrollView(
        primary: true,
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Edit User',
              style: bigText.copyWith(fontFamily: "Poppins", fontSize: 25.sp),
            ),
            alwaysShowMiddle: false,
            middle: Text(
              'Edit User',
              style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
            ),
            /* SvgPicture.asset(
                "assets/images/back.svg",
                height: 30.h,
                width: 30.h,
              ), */
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  _FullNameInput(hintText: user.fullName!),
                  const SizedBox(
                    height: 16,
                  ),
                  _EmailInput(hintText: user.email!),
                  const SizedBox(
                    height: 16,
                  ),
                  _PhoneInput(hintText: user.phone!),
                  const SizedBox(
                    height: 20,
                  ),
                  const _SubmitButton(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FullNameInput extends StatelessWidget {
  const _FullNameInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Full Name",
      widget: BlocBuilder<EditUserCubit, EditUserState>(
        buildWhen: (previous, current) => previous.fullName != current.fullName,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (fullName) {
              context.read<EditUserCubit>().fullNameChanged(fullName);
            },
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Email",
      widget: BlocBuilder<EditUserCubit, EditUserState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (email) {
              context.read<EditUserCubit>().emailChanged(email);
            },
          );
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Phone no.",
      widget: BlocBuilder<EditUserCubit, EditUserState>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (phone) {
              context.read<EditUserCubit>().phoneChanged(phone);
            },
          );
        },
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserCubit, EditUserState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == EditUserStatus.submitting
            ? const UnconstrainedBox(child: CircularProgressIndicator())
            : CustomFormButton(
                innerText: 'Submit',
                onPressed: () {
                  context.read<EditUserCubit>().editUserWithCredentials();
                },
              );
      },
    );
  }
}
