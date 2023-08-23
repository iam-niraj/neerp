import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neerp/screens/Completed%20Activity/activity_form.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/constants.dart';

class CompletedctivityScreen extends StatelessWidget {
  const CompletedctivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
            'Completed Activities',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 30.sp),
          ),
          alwaysShowMiddle: false,
          middle: Text(
            'Completed Activities',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
          ),
          leading: SvgPicture.asset(
            "assets/images/back.svg",
            height: 25.h,
            width: 25.h,
          ),
          border: Border.fromBorderSide(
            BorderSide(
              color: transparent,
              width: 0.0, // 0.0 means one physical pixel
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: false,
          floating: true,
          delegate: HeaderDelegate(
            max: MediaQuery.of(context).size.height / 2.5.h,
            min: MediaQuery.of(context).size.height / 2.5.h,
          ),
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
