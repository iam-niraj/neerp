import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Pending%20Activity/bloc/pending_activities_bloc.dart';
import 'package:neerp/screens/Pending%20Activity/components/pending_activity_card.dart';
import 'package:neerp/screens/Pending%20Activity/cubit/pending_activities_cubit.dart';
import 'package:neerp/screens/Pending%20Activity/filter_form.dart/activity_form.dart';
import 'package:neerp/screens/Pending%20Activity/filter_form.dart/cubit/filter_pending_activities_cubit.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class PendingActivitiesScreen extends StatelessWidget {
  const PendingActivitiesScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(
        builder: (_) => const PendingActivitiesScreen());
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
            create: (context) => PendingActivitiesBloc(
                apiService: context.read<APIService>(),
                cubit: FilterPendingActivitiesCubit(context.read<APIService>()))
              ..add(
                PendingActivitiesFetched(
                  id: userId,
                  token: "123456",
                ),
              ),
            child: const PendingActivities(),
          );
        }),
      ),
    );
  }
}

class PendingActivities extends StatelessWidget {
  const PendingActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PendingActivitiesBloc, PendingActivitiesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: CustomScrollView(
        primary: true,
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Pending Activities',
              style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
            ),
            alwaysShowMiddle: false,
            middle: Text(
              'Pending Activities',
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
          BlocBuilder<PendingActivitiesBloc, PendingActivitiesState>(
            builder: (context, state) {
              switch (state.status) {
                case PendingActivitiesFetchedStatus.failure:
                  return const SliverToBoxAdapter(child: Text("error"));
                case PendingActivitiesFetchedStatus.success:
                  if (state.result.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Text('error fetching activities!'),
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
                            child: PendingActivityCard(
                                activity: state.result[index]),
                          );
                        },
                      ),
                    ),
                  );
                case PendingActivitiesFetchedStatus.initial:
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
