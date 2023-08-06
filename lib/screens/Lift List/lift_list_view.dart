import 'package:flutter/material.dart';
import 'package:neerp/model/lift_model.dart';
import 'package:neerp/screens/Lift%20List/components/lift_card.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/extensions.dart';

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
              MyAppBar(
                width: 40.0.wp,
                title: 'Lift List',
              ),
              SizedBox(
                height: 4.0.hp,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 2.0.hp),
                child: Column(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
