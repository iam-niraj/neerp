import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Edit%20User/edit_user.dart';
import 'package:neerp/screens/User%20List/bloc/users_list_bloc.dart';
import 'package:neerp/screens/User%20List/components/user_card.dart';
import 'package:neerp/screens/User%20List/components/view_user.dart';
import 'package:neerp/utils/components/activity_list_dialog.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(builder: (_) => const UserListScreen());
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
            child: const UserList(),
          );
        }),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({super.key});

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
                                    child: const Text('User Details'),
                                    onPressed: () {
                                      showCustomDialog(
                                        context,
                                        widget: ViewUserPage(
                                          user: state.result[index],
                                        ),
                                      );
                                      // Navigator.pop(context, 'One');
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Activate'),
                                    onPressed: () {
                                      Navigator.pop(context, 'Two');
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Edit User'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          EditUserScreen.route(
                                              state.result[index]));
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
                            child: UserCard(
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
