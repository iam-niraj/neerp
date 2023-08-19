import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Lift%20List/bloc/lift_list_bloc.dart';
import 'package:neerp/screens/Lift%20List/components/lift_card.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class LiftListScreen extends StatelessWidget {
  const LiftListScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LiftListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7eefb),
      body: Builder(builder: (context) {
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
    );
  }
}

class LiftList extends StatelessWidget {
  const LiftList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: SvgPicture.asset('assets/images/back.svg'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Lift List',
                    style: bigText.copyWith(fontFamily: "Poppins"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(0, 28.h, 0, 0),
              child: BlocBuilder<LiftListBloc, LiftListState>(
                builder: (context, state) {
                  switch (state.status) {
                    case LiftFetchedStatus.failure:
                      return const Center(child: Text('failed to fetch posts'));
                    case LiftFetchedStatus.success:
                      if (state.result.isEmpty) {
                        return const Center(child: Text('no posts'));
                      }
                      return Column(
                        children: [
                          ...state.result.map((lift) => LiftCard(lift: lift))
                        ],
                      );
                    case LiftFetchedStatus.initial:
                      return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
