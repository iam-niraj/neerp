// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/screens/Add%20Lift/add_lift.dart';
import 'package:neerp/screens/Dashboard/components/dashboard_item.dart';
import 'package:neerp/screens/Lift%20List/lift_list_view.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/constants.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  //static Page page() => MaterialPage(child: DashboardView());

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => DashboardView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7eefb),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            /*  Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthBlocBloc bloc) => bloc.state.customer.id,
                );
                return Text('UserID: $userId');
              },
            ), */
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.h),
                  title: Text('Welcome',
                      style: mediumText.copyWith(fontSize: 16.sp)),
                  subtitle: Text('Amelia Barlow',
                      style: mediumText.copyWith(fontSize: 20.sp)),
                  leading: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: const Color(0xFF1A3848),
                    child: ClipOval(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/avatar.png"),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Item(
                      icon: 'assets/images/lift.svg',
                      title: "Add Lift",
                      isTextTopPadding: true,
                      onTap: () =>
                          Navigator.push(context, AddLiftScreen.route()),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Item(
                      icon: "assets/images/add_user.svg",
                      title: "Add User",
                      isTextTopPadding: true,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Item(
                      icon: "assets/images/lift.svg",
                      title: "Lift List",
                      isTextTopPadding: true,
                      onTap: () =>
                          Navigator.push(context, LiftListScreen.route()),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Item(
                      icon: 'assets/images/job.svg',
                      icon2: 'assets/images/timer.svg',
                      title: "Ongoing Activities",
                      isTextTopPadding: false,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Item(
                      icon: "assets/images/job.svg",
                      icon2: 'assets/images/assign.svg',
                      title: "Assign Activities",
                      isTextTopPadding: false,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Item(
                      icon: "assets/images/job.svg",
                      icon2: 'assets/images/completed.svg',
                      title: "Completed Activities",
                      isTextTopPadding: false,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 10.w,
                    ),
                    Item(
                      icon: 'assets/images/user_list.svg',
                      title: "User List",
                      isTextTopPadding: true,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
