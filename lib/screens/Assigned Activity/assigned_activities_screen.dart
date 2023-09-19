import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Assigned%20Activity/bloc/assigned_activities_bloc.dart';
import 'package:neerp/screens/Assigned%20Activity/components/assigned_activity_card.dart';
import 'package:neerp/screens/Assigned%20Activity/components/view_details.dart';
import 'package:neerp/screens/Assigned%20Activity/filter_form/activity_form_header.dart';
import 'package:neerp/utils/components/custom_dialog.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class AssignedActivitiesScreen extends StatelessWidget {
  const AssignedActivitiesScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(
        builder: (_) => const AssignedActivitiesScreen());
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
          /* final token = context.select(
            (AuthBlocBloc bloc) => bloc.state.customer.token,
          ); */
          return BlocProvider(
            create: (context) => AssignedActivitiesBloc(
              apiService: context.read<APIService>(),
            )..add(
                AssignedActivitiesFetched(
                  id: userId,
                  token: "123456",
                ),
              ),
            child: const AssignedActivities(),
          );
        }),
      ),
    );
  }
}

class AssignedActivities extends StatelessWidget {
  const AssignedActivities({super.key});

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
        /* SliverPersistentHeader(
          pinned: false,
          floating: true,
          delegate: HeaderDelegate(
              max: MediaQuery.of(context).size.height / 2,
              min: MediaQuery.of(context).size.height / 2),
        ), */
        SliverPadding(
          padding: EdgeInsets.only(top: 20.h),
          sliver: const SliverAppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            pinned: false,
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: BuildForm(),
            ),
          ),
        ),
        BlocBuilder<AssignedActivitiesBloc, AssignedActivitiesState>(
          builder: (context, state) {
            switch (state.status) {
              case AssignedActivitiesFetchedStatus.failure:
                return const SliverToBoxAdapter(child: Text("error"));
              case AssignedActivitiesFetchedStatus.success:
                if (state.result.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('error fetching activities!'),
                    ),
                  );
                }
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 26.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.result.length,
                      (context, index) {
                        return Material(
                          type: MaterialType.transparency,
                          child: GestureDetector(
                            onTap: () => showCustomDialog(
                              context,
                              widget: ViewDetails(
                                result: state.result[index],
                              ),
                            ),
                            child: AssignedActivityCard(
                                activity: state.result[index]),
                          ),
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
