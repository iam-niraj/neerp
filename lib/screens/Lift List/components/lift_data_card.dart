import 'package:flutter/material.dart';
import 'package:neerp/utils/constants.dart';
import 'package:neerp/utils/extensions.dart';

class LiftDtata extends StatelessWidget {
  const LiftDtata({
    super.key,
    required this.subTitle,
    required this.title,
  });

  final String subTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: bigText.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 1.0.wp,
        ),
        Text(
          subTitle,
          style: bigText.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
