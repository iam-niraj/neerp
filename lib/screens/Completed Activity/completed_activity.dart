import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/screens/Completed%20Activity/activity_form.dart';
import 'package:neerp/utils/constants.dart';

class CompletedctivityScreen extends StatelessWidget {
  const CompletedctivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFf3f8fe),
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: CompletedActivity(),
      ),
    );
  }
}

class CompletedActivity extends StatelessWidget {
  const CompletedActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Add Lift',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
          ),
          alwaysShowMiddle: false,
          middle: Text(
            'Add Lift',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
          ),
          backgroundColor: const Color(0xFFf3f8fe),
          leading: SvgPicture.asset(
            "assets/images/back.svg",
            height: 30.h,
            width: 30.h,
          ),
        ),
        SliverPersistentHeader(
          pinned: false,
          floating: true,
          delegate: HeaderDelegate(),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          sliver: SliverList.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: CupertinoColors.black,
              );
            },
          ),
        )
      ],
    );
  }
}
