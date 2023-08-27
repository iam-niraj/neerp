import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Service%20Details/bloc/service_details_bloc.dart';
import 'package:neerp/screens/Service%20Details/components/service_detail_card.dart';
import 'package:neerp/utils/components/activity_list_dialog.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/config/services/api_service.dart';

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
                Expanded(
                  child: Column(
                    children: [
                      ...state.result.map(
                        (service) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: ServiceDetailCard(
                              service: service,
                              onTap: () {
                                showCustomDialog(context, widget: Container());
                              }),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      CustomFormButton(
                        innerText: "Get Report",
                        onPressed: () {},
                        fontSize: 24.sp,
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                    ],
                  ),
                ),
              ],
            );

          case ServicesFetchedStatus.initial:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
