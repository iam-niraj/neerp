import 'package:flutter/material.dart';
import 'package:neerp/models/user_list/user_response_model.dart';
import 'package:neerp/utils/components/data_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final Result user;

  @override
  Widget build(BuildContext context) {
    return /* Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 23,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 25),
              blurRadius: 40,
              spreadRadius: -5,
              color: const Color(0xFF3d4785).withOpacity(.1),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataCard(
            title: 'Site Name:',
            subTitle: lift.siteName!,
          ),
          DataCard(
            title: 'Customer Name:',
            subTitle: lift.customerName!,
          ),
          DataCard(
            title: 'Email:',
            subTitle: lift.email!,
          ),
          DataCard(
            title: 'Phone:',
            subTitle: lift.phone!,
          ),
        ],
      ),
    ); */

        Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
        horizontal: 2.w,
      ),
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: const Color(0xff262626)),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          DataCard(
            title: user.fullName!,
            subTitle: '',
          ),
          DataCard(
            title: 'Email:',
            subTitle: user.email!,
          ),
          DataCard(
            title: 'Phone:',
            subTitle: user.phone!,
          ),
          DataCard(
            title: 'Username:',
            subTitle: user.username!,
          ),

          /*  SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Button(
                    title: 'View Lift',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  const Button(
                    title: 'Edit Lift',
                  ),
                ],
              ), */
        ],
      ),
    );
  }
}
