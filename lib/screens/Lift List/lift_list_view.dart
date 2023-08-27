import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Lift%20List/bloc/lift_list_bloc.dart';
import 'package:neerp/screens/Lift%20List/components/lift_card.dart';
import 'package:neerp/screens/Lift%20List/components/view_lift.dart';
import 'package:neerp/screens/Service%20Details/service_details_screen.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/activity_list_dialog.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class LiftListScreen extends StatelessWidget {
  const LiftListScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(builder: (_) => const LiftListScreen());
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
            create: (_) => LiftListBloc(
                apiService: RepositoryProvider.of<APIService>(context))
              ..add(LiftsFetched(id: userId, token: token!)),
            child: const LiftList(),
          );
        }),
      ),
    );
  }
}

class LiftList extends StatelessWidget {
  const LiftList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Lift List',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
          ),
          alwaysShowMiddle: false,
          middle: Text(
            'Lift List',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
          ),
          backgroundColor: kGlassyColor,
        ),
        BlocBuilder<LiftListBloc, LiftListState>(
          builder: (context, state) {
            switch (state.status) {
              case LiftFetchedStatus.failure:
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text('failed to fetch posts'),
                  ),
                );
              case LiftFetchedStatus.success:
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
                                    child: const Text('Lift Details'),
                                    onPressed: () {
                                      showCustomDialog(
                                        context,
                                        widget: ViewLiftPage(
                                          lift: state.result[index],
                                        ),
                                      );
                                      // Navigator.pop(context, 'One');
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Service Details'),
                                    onPressed: () {
                                      showCustomDialog(
                                        context,
                                        widget: ServiceDetailsScreen(
                                          lift: state.result[index],
                                        ),
                                      );
                                      // Navigator.pop(context, 'One');
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Edit List'),
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
                            child: LiftCard(
                              lift: state.result[index],
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
              case LiftFetchedStatus.initial:
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
