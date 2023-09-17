import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/models/user_list/user_response_model.dart';
import 'package:neerp/screens/Pending%20Activity/bloc/pending_activities_bloc.dart';
import 'package:neerp/screens/Pending%20Activity/components/pending_activity_card.dart';
import 'package:neerp/screens/Pending%20Activity/filter_form.dart/activity_form_header.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/assign_activity_form/cubit/assign_activity_cubit.dart';
import 'package:neerp/utils/components/custom_dialog.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/components/dialog_custom_field.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class PendingActivitiesScreen extends StatelessWidget {
  const PendingActivitiesScreen({super.key});

  static Route<void> route() {
    return CupertinoPageRoute<void>(
        builder: (_) => const PendingActivitiesScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: Builder(builder: (context) {
          final userId = context.select(
            (AuthBlocBloc bloc) => bloc.state.customer.id,
          );
          /* final token = context.select(
            (AuthBlocBloc bloc) => bloc.state.customer.token,
          ); */
          return BlocProvider(
            create: (context) => PendingActivitiesBloc(
              apiService: context.read<APIService>(),
            )..add(
                PendingActivitiesFetched(
                  id: userId,
                  token: "123456",
                ),
              ),
            child: const PendingActivities(),
          );
        }),
      ),
    );
  }
}

class PendingActivities extends StatelessWidget {
  const PendingActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Pending Activities',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
          ),
          alwaysShowMiddle: false,
          middle: Text(
            'Pending Activities',
            style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
          ),
        ),
        /* SliverPersistentHeader(
          pinned: false,
          floating: true,
          delegate: HeaderDelegate(
              max: MediaQuery.of(context).size.height / 2,
              min: MediaQuery.of(context).size.height / 2),
        ), */
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          sliver: SliverAppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            pinned: false,
            automaticallyImplyLeading: false,
            expandedHeight: 300.0.h,
            flexibleSpace: const FlexibleSpaceBar(
              background: BuildForm(),
            ),
          ),
        ),
        BlocBuilder<PendingActivitiesBloc, PendingActivitiesState>(
          builder: (context, state) {
            switch (state.status) {
              case PendingActivitiesFetchedStatus.failure:
                return const SliverToBoxAdapter(child: Text("error"));
              case PendingActivitiesFetchedStatus.success:
                if (state.result.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('error fetching activities!'),
                    ),
                  );
                }
                return SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 26.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.result.length,
                      (context, index) {
                        return Material(
                          type: MaterialType.transparency,
                          child: GestureDetector(
                            onTap: () => showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) =>
                                  CupertinoActionSheet(
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    child: const Text('Lift Details'),
                                    onPressed: () {
                                      showCustomDialog(
                                        context,
                                        widget: Container(),
                                      );
                                      // Navigator.pop(context, 'One');
                                    },
                                  ),
                                  BlocProvider(
                                    create: (context) => AssignActivityCubit(
                                        context.read<APIService>())
                                      ..getEmployees("127"),
                                    child: Builder(builder: (context) {
                                      final res = context.select(
                                          (AssignActivityCubit cubit) =>
                                              cubit.state.result);
                                      final userId = context.select(
                                          (AuthBlocBloc bloc) =>
                                              bloc.state.customer.id);
                                      return CupertinoActionSheetAction(
                                        child: const Text(
                                          'Assign Activity',
                                        ),
                                        onPressed: () {
                                          if (res.isEmpty) {
                                            Navigator.pop(context);
                                            showCupertinoSnackBar(
                                                context: context,
                                                message:
                                                    "No Employees to Assign!");
                                          } else {
                                            showCustomDialog(context,
                                                widget: BlocProvider(
                                                  create: (context) =>
                                                      AssignActivityCubit(
                                                          context.read<
                                                              APIService>()),
                                                  child: Builder(
                                                      builder: (context) {
                                                    return BlocListener<
                                                        AssignActivityCubit,
                                                        AssignActivityState>(
                                                      listener:
                                                          (context, state) {
                                                        if (state.status ==
                                                            AssignActivityStatus
                                                                .failure) {
                                                          showCupertinoSnackBar(
                                                              context: context,
                                                              message: state
                                                                  .errorResponse);
                                                        } else if (state
                                                                .status ==
                                                            AssignActivityStatus
                                                                .success) {
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child: Column(
                                                        children: [
                                                          _AssignDate(),
                                                          SizedBox(
                                                            height: 16.h,
                                                          ),
                                                          _EmployeeDropDown(
                                                              values: res),
                                                          SizedBox(
                                                            height: 16.h,
                                                          ),
                                                          _SubmitButton(
                                                              userId,
                                                              state
                                                                  .result[index]
                                                                  .id!)
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                ));
                                          }
                                          // Navigator.pop(context, 'One');
                                        },
                                      );
                                    }),
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ),
                            ),
                            child: PendingActivityCard(
                                activity: state.result[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              case PendingActivitiesFetchedStatus.initial:
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
            }
          },
        ),
      ],
    );
  }
}

class _AssignDate extends StatelessWidget {
  _AssignDate();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DialogCutsomField(
        labelText: "Start Date",
        widget: BlocBuilder<AssignActivityCubit, AssignActivityState>(
          builder: (context, state) {
            return TextField(
              controller: _textEditingController,
              readOnly: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: white,
                hintText: "Select start date",
                contentPadding: EdgeInsets.zero,
              ),
              onTap: () async {
                DateTime? pickerDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2121));
                if (pickerDate != null) {
                  _textEditingController
                    ..text = DateFormat.yMMMMd().format(pickerDate)
                    ..selection = TextSelection.fromPosition(
                      TextPosition(
                          offset: _textEditingController.text.length,
                          affinity: TextAffinity.upstream),
                    );
                } else {}
              },
              onChanged: (startDate) {
                context.read<AssignActivityCubit>().startDateChanged(startDate);
              },
            );
          },
        ));
  }
}

class _EmployeeDropDown extends StatelessWidget {
  _EmployeeDropDown({required this.values});
  final List<Result> values;
  @override
  Widget build(BuildContext context) {
    return DialogCutsomField(
      labelText: "Employee",
      widget: BlocBuilder<AssignActivityCubit, AssignActivityState>(
        builder: (context, state) {
          return DropdownButtonFormField(
            isExpanded: false,
            value: null,
            iconDisabledColor: Colors.grey,
            iconEnabledColor: black,
            style: mediumText,
            decoration: const InputDecoration(
              filled: true,
              fillColor: white,
              hintText: "Select Employee",
              contentPadding: EdgeInsets.zero,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            onChanged: (empId) {
              context.read<AssignActivityCubit>().empChanged(empId!);
            },
            items: values.map(
              (value) {
                return DropdownMenuItem<String>(
                  value: value.id,
                  child: Text(
                    value.username.toString(),
                    style: mediumText.copyWith(color: Colors.black),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.userId, this.actId);

  final String userId, actId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssignActivityCubit, AssignActivityState>(
      builder: (context, state) {
        return CustomFormButton(
          innerText: 'Submit',
          onPressed: () {
            context.read<AssignActivityCubit>().assignActivity(userId, actId);
          },
        );
      },
    );
  }
}
