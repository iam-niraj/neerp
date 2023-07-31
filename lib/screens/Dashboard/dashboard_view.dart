import 'package:flutter/material.dart';
import 'package:neerp/utils/colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: bgColor,
        ),
        child: const Scaffold(
          backgroundColor: bgColor,
        ));
  }
}
