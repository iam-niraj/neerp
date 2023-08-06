// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neerp/utils/extensions.dart';

final bigText = TextStyle(
  fontFamily: 'SFNFDisplay',
  fontSize: 12.0.sp,
  color: Color(0xff000000),
);
final description = TextStyle(
  fontFamily: 'SFNFDisplay',
  fontSize: 12.0.sp,
);

final mediumText = TextStyle(
  fontFamily: 'SFNFDisplay',
  fontSize: 18.0.sp,
);

final smallText = TextStyle(
  fontFamily: 'SFNFDisplay',
  fontSize: 14.0.sp,
);

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
