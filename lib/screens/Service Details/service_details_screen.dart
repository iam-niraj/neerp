import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Service%20Details/bloc/service_details_bloc.dart';
import 'package:neerp/screens/Service%20Details/components/service_detail_card.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/lift_list/lift_response_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({required this.lift, super.key});

  final Result lift;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final userId = context.select(
        (AuthBlocBloc bloc) => bloc.state.customer.id,
      );
      print(userId);
      final token = context.select(
        (AuthBlocBloc bloc) => bloc.state.customer.token,
      );
      return BlocProvider(
        create: (_) => ServiceDetailsBloc(
            apiService: RepositoryProvider.of<APIService>(context))
          ..add(
            ServicesFetched(id: userId, token: token!, leadId: lift.leadId!),
          ),
        child: const ServiceDetailsList(),
      );
    });
  }
}

class ServiceDetailsList extends StatelessWidget {
  const ServiceDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceDetailsBloc, ServiceDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case ServicesFetchedStatus.failure:
            return const Center(
              child: Text('failed to fetch posts'),
            );
          case ServicesFetchedStatus.success:
            if (state.result.isEmpty) {
              return const Center(
                child: Text('no posts'),
              );
            }
            return Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Service Details",
                    style: kHeadline.copyWith(fontSize: 24.sp),
                  ),
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Expanded(
                  child: Column(
                    children: [
                      ...state.result.map(
                        (service) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: ServiceDetailCard(
                            service: service,
                            onTap: () {
                              context.read<ServiceDetailsBloc>().add(
                                    ViewActivityEvent(
                                        activityId: service.id!,
                                        token: "123456"),
                                  );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      CustomFormButton(
                        innerText: "Get Report",
                        onPressed: () {},
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            );

          case ServicesFetchedStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ServicesFetchedStatus.view:
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Activity Details",
                    style: kHeadline.copyWith(fontSize: 24.sp),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Activity Date:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${state.viewActivity!.activityStartDate!} to ${state.viewActivity!.activityEndDate!}",
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Start Comment:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.viewActivity!.startComment!,
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "End Comment:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.viewActivity!.endComment!,
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Served Checkedlist:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.viewActivity!.servedChecklist!,
                          style: kBodyText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Customer Remark:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Good",
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Site Name:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.viewActivity!.siteName!,
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 2.0.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Site Address:",
                          style: kHeadline.copyWith(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          state.viewActivity!.siteAddress!,
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                    ],
                  ),
                ),
                CustomFormButton(
                  innerText: "Back",
                  onPressed: () => context
                      .read<ServiceDetailsBloc>()
                      .add(const LoadServices()),
                ),
              ],
            );
        }
      },
    );
  }
}
