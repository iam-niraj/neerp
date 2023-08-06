import 'package:flutter/material.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/appBar.dart';
import 'package:neerp/utils/extensions.dart';

class CompletedActivityView extends StatelessWidget {
  const CompletedActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: MyAppBar(width: 40.0.wp, title: "Completed Activities")),
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
                          horizontal: 4.0.wp, vertical: 2.0.hp),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 80.0.hp,
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
                          horizontal: 4.0.wp, vertical: 2.0.hp),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 80.0.hp,
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
                            ]),
                      ),
                    );
            },
          ),
        ),
      ]),
    );
  }
}
