// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/screens/Dashboard/components/dashboard_set1.dart';
import 'package:neerp/screens/Dashboard/components/dashboard_set2.dart';
import 'package:neerp/screens/Dashboard/components/user_set.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/extensions.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  double iconHeight = Get.height - 65.0.hp;
  double iconWidth = Get.width - 40.0.wp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 2.0.hp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
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
                    icon: "assets/images/lift_icon.png",
                    title: 'Add Lift',
                  ),
                  UserSet(
                    iconHeight: iconHeight / 2,
                    iconWidth: iconWidth / 2,
                    icon: "assets/images/user.png",
                    title: 'Add User',
                  ),
                  DashboardSet1(
                    iconHeight: iconHeight / 2,
                    iconWidth: iconWidth / 2,
                    icon: "assets/images/lift_icon.png",
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
                    iconHeight: iconHeight,
                    iconWidth: iconWidth,
                    icon: "assets/images/ongoing.png",
                    title: 'Pending Activity',
                  ),
                  DashboardSet2(
                    iconHeight: iconHeight,
                    iconWidth: iconWidth,
                    icon: "assets/images/completed.png",
                    title: 'Completed Activity',
                  ),
                  DashboardSet2(
                    iconHeight: iconHeight,
                    iconWidth: iconWidth,
                    icon: "assets/images/assign.png",
                    title: 'Assign Activity',
                  ),
                ],
              ),
              SizedBox(
                height: 4.0.hp,
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
                      icon: "assets/images/user.png",
                      title: "User List",
                      icon2: "assets/images/list.png",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
