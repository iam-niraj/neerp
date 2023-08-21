import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/utils/constants.dart';

void showCupertinoSnackBar({
  required BuildContext context,
  required String message,
  int durationMillis = 3000,
}) {
  const animationDurationMillis = 200;
  final overlayEntry = OverlayEntry(
    builder: (context) => _CupertinoSnackBar(
      message: message,
      animationDurationMillis: animationDurationMillis,
      waitDurationMillis: durationMillis,
    ),
  );
  Future.delayed(
    Duration(milliseconds: durationMillis + 2 * animationDurationMillis),
    overlayEntry.remove,
  );
  Overlay.of(context).insert(overlayEntry);
}

class _CupertinoSnackBar extends StatefulWidget {
  final String message;
  final int animationDurationMillis;
  final int waitDurationMillis;

  const _CupertinoSnackBar({
    Key? key,
    required this.message,
    required this.animationDurationMillis,
    required this.waitDurationMillis,
  }) : super(key: key);

  @override
  State<_CupertinoSnackBar> createState() => _CupertinoSnackBarState();
}

class _CupertinoSnackBarState extends State<_CupertinoSnackBar> {
  bool _show = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => setState(() => _show = true));
    Future.delayed(
      Duration(
        milliseconds: widget.waitDurationMillis,
      ),
      () {
        if (mounted) {
          setState(() => _show = false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: _show ? 8.0.h : -50.0.h,
      left: 8.0.w,
      right: 8.0.w,
      curve: _show ? Curves.linearToEaseOut : Curves.easeInToLinear,
      duration: Duration(milliseconds: widget.animationDurationMillis),
      child: CupertinoPopupSurface(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
                vertical: 8.0.h,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Color(0xFFff4667),
                    size: 30,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    widget.message,
                    style: mediumText.copyWith(
                      color: const Color(0xFFff4667),
                    ),
                  ),
                ], /* Text(
                widget.message,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: CupertinoColors.secondaryLabel,
                ),
                textAlign: TextAlign.center, */
              ),
            ),
          ),
        ),
      ),
    );
  }
}
