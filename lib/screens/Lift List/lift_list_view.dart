import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/model/lift_model.dart';
import 'package:neerp/screens/Lift%20List/components/lift_card.dart';
import 'package:neerp/utils/components/appBar.dart';

class LiftList extends StatelessWidget {
  const LiftList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(
                title: 'Lift List',
              ),
              SizedBox(
                height: 24.h,
              ),
              Column(
                children: [
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
                  ),
                  LiftCard(
                    lift: LiftModel(
                        siteName: "Society",
                        customerName: "Shruti",
                        email: "email.com",
                        phoneNo: "9898989898"),
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
