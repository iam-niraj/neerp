// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, sort_child_properties_last, unused_field, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Add%20User/cubit/add_user_cubit.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/components/drop_down_text_field.dart';
import 'package:neerp/utils/components/error_dialog.dart';
import 'package:neerp/utils/components/text_field.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/config/services/api_service.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AddUserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => AddUserCubit(context.read<APIService>()),
        child: const AddUser(),
      ),
    );
  }
}

class AddUser extends StatelessWidget {
  const AddUser() : super();

  @override
  Widget build(BuildContext context) {
    final parentId =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.id);
    return Builder(builder: (context) {
      return BlocListener<AddUserCubit, AddUserState>(
        listener: (context, state) {
          if (state.status == AddUserStatus.error) {
            /*  ErrorDialog(
              errorObject: state.errorResponse,
            ); */
          }
        },
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        ),
      );
    });
  }
}
