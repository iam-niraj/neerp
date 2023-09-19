import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/utils/components/avatar.dart';
import 'package:neerp/utils/components/custom_form_button.dart';

class ViewDashboardUserPage extends StatelessWidget {
  const ViewDashboardUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullname =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.fullName);
    final email =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.email);
    final phone =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.phone);
    final username =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.username);

    return Column(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Avatar(),
        ),
        SizedBox(
          height: 24.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Full Name:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            fullname ?? " ",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            email ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Mobile Number:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            phone ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Username:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            username ?? "",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 30.0.h,
        ),
        const _LogoutButton(),
        const Spacer(),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return CustomFormButton(
      innerText: 'Logout',
      onPressed: () {
        Navigator.pop(context);
        context.read<AuthBlocBloc>().add(AppLogoutRequested());
      },
    );
  }
}
