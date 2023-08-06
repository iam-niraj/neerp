// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/screens/Dashboard/components/dashboard_set1.dart';
import 'package:neerp/screens/Dashboard/components/dashboard_set2.dart';
import 'package:neerp/screens/Dashboard/components/user_set.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/extensions.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final double iconHeight = Get.height - 65.0.hp;
  final double iconWidth = Get.width - 40.0.wp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(
                  width: 25.0.wp,
                  title: 'Dashboard',
                ),
                SizedBox(
                  height: 4.0.hp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardSet1(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/lift.png",
                      title: 'Add Lift',
                    ),
                    UserSet(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/users.png",
                      title: 'Add User',
                    ),
                    DashboardSet1(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/lift.png",
                      title: 'Lift List',
                      icon2: "assets/images/list.png",
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0.hp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DashboardSet2(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/ongoing.png",
                      title1: 'Pending',
                      title2: 'Activity',
                    ),
                    DashboardSet2(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/completed.png",
                      title1: 'Completed',
                      title2: 'Activity',
                    ),
                    DashboardSet2(
                      iconHeight: iconHeight / 2,
                      iconWidth: iconWidth / 2,
                      icon: "assets/images/assign_icon.png",
                      title1: 'Assign',
                      title2: 'Activity',
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.0.hp,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.0.wp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserSet(
                        iconHeight: iconHeight / 2,
                        iconWidth: iconWidth / 2,
                        icon: "assets/images/users.png",
                        title: "User List",
                        icon2: "assets/images/list.png",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}