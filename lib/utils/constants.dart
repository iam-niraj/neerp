import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/colors.dart';

final bigText = TextStyle(
  fontFamily: 'Intel',
  fontSize: 30.0.sp,
  color: black,
);

final description = TextStyle(
    fontFamily: 'Intel', fontSize: 18.0.sp, fontWeight: FontWeight.w500);

final mediumText = TextStyle(
  fontFamily: 'Intel',
  fontSize: 18.0.sp,
);

final smallText = TextStyle(
  fontFamily: 'Intel',
  fontSize: 14.0.sp,
);

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);

const kHeadline = TextStyle(
  color: Colors.black,
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

const kBodyText = TextStyle(
  color: Colors.black54,
  fontSize: 15,
);

const kBodyText2 = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w500,
  color: Colors.black54,
);
