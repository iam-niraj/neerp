import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/models/activate_model/reequest_activate_model.dart';
import 'package:neerp/screens/Users%20List/bloc/users_list_bloc.dart';
import 'package:neerp/screens/Users%20List/components/users_card.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(builder: (_) => const UsersListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: Builder(builder: (context) {
          final userId = context.select(
            (AuthBlocBloc bloc) => bloc.state.customer.id,
          );
          final token = context.select(
            (AuthBlocBloc bloc) => bloc.state.customer.token,
          );
          return BlocProvider(
            create: (_) => UsersListBloc(
                apiService: RepositoryProvider.of<APIService>(context))
              ..add(UsersFetched(id: userId, token: token!)),
            child: const UsersList(),
          );
        }),
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Users List',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
          ),
          alwaysShowMiddle: false,
          middle: Text(
            'Users List',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
          ),
        ),
        BlocBuilder<UsersListBloc, UsersListState>(
          builder: (context, state) {
            switch (state.status) {
              case UsersFetchedStatus.failure:
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('failed to fetch posts'),
                  ),
                );
              case UsersFetchedStatus.success:
                if (state.result.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('no posts'),
                    ),
                  );
                }
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 26.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Material(
                          type: MaterialType.transparency,
                          child: GestureDetector(
                            onTap: () => showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoActionSheet(
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    child: const Text('Activate'),
                                    onPressed: () async {
                                      await APIService.activateUser(
                                        RequestActivateUser(
                                          userId: state.result[index].id,
                                        ),
                                      )
                                          ? showCupertinoSnackBar(
                                              context: context,
                                              message:
                                                  "User Activation Successful ")
                                          : showCupertinoSnackBar(
                                              context: context,
                                              message:
                                                  "User Activation Failed");

                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Edit User'),
                                    onPressed: () {
                                      Navigator.pop(context, 'Two');
                                    },
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ),
                            ),
                            child: UsersCard(
                              user: state.result[index],
                            ),
                          ),
                        );
                      },
                      childCount: state.result.length,
                    ),
                  ),
                );
              /* return Column(
                        children: [
                          ...state.result.map((lift) => LiftCard(lift: lift))
                        ],
                      ); */
              case UsersFetchedStatus.initial:
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}
