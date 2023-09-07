// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Add%20Lift/add_lift.dart';
import 'package:neerp/screens/Add%20User/add_user.dart';
import 'package:neerp/screens/Assigned%20Activity/assigned_activities_screen.dart';
import 'package:neerp/screens/Completed%20Activity/completed_activity_screen.dart';
import 'package:neerp/screens/Dashboard/components/dashboard_item.dart';
import 'package:neerp/screens/Lift%20List/lift_list_view.dart';
import 'package:neerp/screens/Pending%20Activity/pending_activity_screen.dart';
import 'package:neerp/screens/User%20List/user_list_view.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/custom_dialog.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
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
                GestureDetector(
                  onTap: () =>
                      showCustomDialog(context, widget: const _SubmitButton()),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                    ),
                    title: Text(
                      'Welcome,',
                      style: mediumText.copyWith(
                        fontSize: 20.sp,
                      ),
                    ),
                    subtitle: Text('Amelia Barlow',
                        style: mediumText.copyWith(
                          fontSize: 25.sp,
                          fontFamily: "Poppins",
                        )),
                    leading: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: const Color(0xFF1A3848),
                      child: ClipOval(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset("assets/images/avatar.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
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
                        onTap: () =>
                            Navigator.push(context, AddUserScreen.route()),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Item(
                        icon: "assets/images/lift.svg",
                        icon2: /* SvgPicture.asset(
                          "assets/images/list.svg",
                          height: 32.h,
                          width: 32.w,
                        ), */
                            Stack(
                          children: [
                            Icon(
                              Icons.circle_sharp,
                              color: kPrimaryColor,
                              size: 32.h,
                            ),
                            Positioned.fill(
                              child: Icon(
                                Icons.list_sharp,
                                color: white,
                                size: 25.h,
                              ),
                            ),
                          ],
                        ),
                        isLiftList: true,
                        title: "Lift List",
                        isTextTopPadding: true,
                        onTap: () => Navigator.push(
                          context,
                          LiftListScreen.route(),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Item(
                        icon: 'assets/images/job.svg',
                        icon2: Stack(
                          children: [
                            Icon(
                              Icons.circle_sharp,
                              color: white,
                              size: 32.h,
                            ),
                            Icon(
                              Icons.access_time_filled_rounded,
                              color: kPrimaryColor,
                              size: 32.h,
                            ),
                          ],
                        ),
                        title: "Ongoing Activities",
                        isTextTopPadding: false,
                        onTap: () => Navigator.push(
                            context, PendingActivitiesScreen.route()),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Item(
                        icon: "assets/images/job.svg",
                        icon2: Stack(
                          children: [
                            Icon(
                              Icons.circle_sharp,
                              color: white,
                              size: 32.h,
                            ),
                            Icon(
                              Icons.build_circle_rounded,
                              color: kPrimaryColor,
                              size: 32.h,
                            ),
                          ],
                        ),
                        title: "Assign Activities",
                        isTextTopPadding: false,
                        onTap: () => Navigator.push(
                            context, AssignedActivitiesScreen.route()),
                      ),
                      
                      SizedBox(
                        width: 10.w,
                      ),
                      Item(
                        icon: "assets/images/job.svg",
                        icon2: Stack(
                          children: [
                            Icon(
                              Icons.circle_sharp,
                              color: white,
                              size: 32.h,
                            ),
                            Icon(
                              Icons.check_circle_rounded,
                              color: kPrimaryColor,
                              size: 32.h,
                            ),
                          ],
                        ),
                        title: "Completed Activities",
                        isTextTopPadding: false,
                        onTap: () => Navigator.push(
                            context, CompletedActivitiesScreen.route()),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Item(
                        icon: 'assets/images/user_list.svg',
                        title: "User List",
                        isTextTopPadding: true,
                        onTap: () => Navigator.push(
                          context,
                          UserListScreen.route(),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Spacer(
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return CustomFormButton(
      innerText: 'Logout',
      onPressed: () {
        context.read<AuthBlocBloc>().add(AppLogoutRequested());
      },
    );
  }
}
