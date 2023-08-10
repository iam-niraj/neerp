import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/appBar.dart';

class CompletedActivityView extends StatelessWidget {
  const CompletedActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
            child: MyAppBar(title: "Completed Activities")),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (
              context,
              index,
            ) {
              return index % 2 == 0
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(80)),
                            border: Border.all(color: kPrimaryColor),
                            boxShadow: const [
                              BoxShadow(
                                  color: kSecondaryColor,
                                  offset: Offset(-10.0, 0.0),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0),
                            ]),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(80)),
                          border: Border.all(color: kPrimaryColor),
                          boxShadow: const [
                            BoxShadow(
                                color: kSecondaryColor,
                                offset: Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ]),
    );
  }
}
