import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Assigned%20Activity/bloc/assigned_activity_bloc.dart';
import 'package:neerp/screens/Assigned%20Activity/components/assigned_activity_card.dart';
import 'package:neerp/screens/Completed%20Activity/activity_form.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class AssignedctivityScreen extends StatelessWidget {
  const AssignedctivityScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(
        builder: (_) => const AssignedctivityScreen());
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
            create: (context) => AssignedActivityBloc(
                apiService: RepositoryProvider.of<APIService>(context))
              ..add(
                AssignedActivitiesFetched(id: userId, token: token!),
              ),
            child: const AssignedActivity(),
          );
        }),
      ),
    );
  }
}

class AssignedActivity extends StatelessWidget {
  const AssignedActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Assigned Activities',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
          ),
          alwaysShowMiddle: false,
          middle: Text(
            'Assigned Activities',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
          ),
        ),
        SliverPersistentHeader(
          pinned: false,
          floating: true,
          delegate: HeaderDelegate(
              max: MediaQuery.of(context).size.height / 2,
              min: MediaQuery.of(context).size.height / 2),
        ),
        BlocBuilder<AssignedActivityBloc, AssignedActivityState>(
          builder: (context, state) {
            switch (state.status) {
              case AssignedActivitiesFetchedStatus.failure:
                return const SliverToBoxAdapter(child: Text("error"));
              case AssignedActivitiesFetchedStatus.success:
                if (state.result.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('no assigned activities'),
                    ),
                  );
                }
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.h, horizontal: 26.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.result.length,
                      (context, index) {
                        return Material(
                          type: MaterialType.transparency,
                          child: AssignedActivityCard(
                              activity: state.result[index]),
                        );
                      },
                    ),
                  ),
                );
              case AssignedActivitiesFetchedStatus.initial:
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
