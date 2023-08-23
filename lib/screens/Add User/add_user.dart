// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, sort_child_properties_last, unused_field, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Add%20User/cubit/add_user_cubit.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/components/error_dialog.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(builder: (_) => const AddUserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => AddUserCubit(RepositoryProvider.of(context)),
          child: const AddUser(),
        ),
      ),
    );
  }
}

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final parentId =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.id);
    return Builder(builder: (context) {
      context.read<AddUserCubit>().parentIdChanged(parentId);
      return BlocListener<AddUserCubit, AddUserState>(
        listener: (context, state) {
          if (state.status == AddUserStatus.error) {
            /*  ErrorDialog(
              errorObject: state.errorResponse,
            ); */
            showCupertinoSnackBar(
                context: context, message: state.errorResponse);
          }
        },
        child: CustomScrollView(
          primary: true,
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Add User',
                style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
              ),
              alwaysShowMiddle: false,
              middle: Text(
                'Add User',
                style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const _FullNameInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _EmailInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _PhoneInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _UsernameInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _PasswordInput(),
                    const SizedBox(
                      height: 16,
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
    });
  }
}

class _FullNameInput extends StatelessWidget {
  const _FullNameInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Full Name",
      widget: BlocBuilder<AddUserCubit, AddUserState>(
        buildWhen: (previous, current) => previous.fullName != current.fullName,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter full name",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (fullName) {
              context.read<AddUserCubit>().fullNameChanged(fullName);
            },
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Email",
      widget: BlocBuilder<AddUserCubit, AddUserState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter email",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (email) {
              context.read<AddUserCubit>().emailChanged(email);
            },
          );
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Phone no.",
      widget: BlocBuilder<AddUserCubit, AddUserState>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter phone number",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (phone) {
              context.read<AddUserCubit>().phoneChanged(phone);
            },
          );
        },
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Username",
      // prefix: const Icon(Icons.person_pin_outlined),
      widget: BlocBuilder<AddUserCubit, AddUserState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          // return TextField(
          //   onChanged: (email) {
          //     context.read<LoginCubit>().emailChanged(email);
          //   },
          //   decoration: const InputDecoration(labelText: "Username"),
          // );
          return TextField(
            // obscureText: (widget.obscureText && _obscureText),
            decoration: const InputDecoration(
              hintText: "Enter your username",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (username) {
              context.read<AddUserCubit>().usernameChanged(username);
            },
          );
        },
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Password",
      prefix: const Icon(Icons.lock_outline_rounded),
      widget: BlocBuilder<AddUserCubit, AddUserState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          // return TextField(
          //   onChanged: (password) {
          //     context.read<LoginCubit>().passwordChanged(password);
          //   },
          //   decoration: const InputDecoration(labelText: "Password"),
          // );

          return TextField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Enter your password",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (password) {
              context.read<AddUserCubit>().passwordChanged(password);
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
    return BlocBuilder<AddUserCubit, AddUserState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == AddUserStatus.submitting
            ? UnconstrainedBox(child: const CircularProgressIndicator())
            : CustomFormButton(
                innerText: 'Submit',
                onPressed: () {
                  context.read<AddUserCubit>().addUserWithCredentials();
                },
              );
      },
    );
  }
}
