import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neerp/model/lift_model.dart';
import 'package:neerp/screens/Lift%20List/components/button.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/extensions.dart';

import 'lift_data_card.dart';

class LiftCard extends StatelessWidget {
  LiftCard({super.key, required this.lift});

  final LiftModel lift;

  final cardHeight = Get.height - 80.0.hp;
  final cardWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0.hp),
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0.wp, ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LiftDtata(
                title: 'Site Name:',
                subTitle: lift.siteName,
              ),
              SizedBox(
                height: 0.5.hp,
              ),
              LiftDtata(
                title: 'Customer Name:',
                subTitle: lift.customerName,
              ),
              SizedBox(
                height: 0.5.hp,
              ),
              LiftDtata(
                title: 'Email:',
                subTitle: lift.email,
              ),
              SizedBox(
                height: 0.5.hp,
              ),
              LiftDtata(
                title: 'Phone: ',
                subTitle: lift.phoneNo,
              ),
              SizedBox(
                height: 1.5.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    title: 'View Lift',
                  ),
                  SizedBox(
                    width: 3.0.wp,
                  ),
                  Button(
                    title: 'Edit Lift',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
