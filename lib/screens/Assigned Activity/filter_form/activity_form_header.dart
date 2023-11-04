import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neerp/screens/Assigned%20Activity/bloc/assigned_activities_bloc.dart';
import 'package:neerp/screens/Assigned%20Activity/filter_form/cubit/filter_assigned_activities_cubit.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterAssignedActivitiesCubit(context.read<APIService>()),
      child: const MyFlexiableAppBar(),
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  const MyFlexiableAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: statusBarHeight,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocListener<FilterAssignedActivitiesCubit,
            FilterAssignedActivitiesState>(
          listener: (context, state) {
            if (state.status == FilterAssignedActivitiesStatus.error) {
              showCupertinoSnackBar(
                  context: context, message: state.errorResponse);
            } else if (state.status == FilterAssignedActivitiesStatus.success) {
              context
                  .read<AssignedActivitiesBloc>()
                  .add(FilteredAssignedActivitiesFetched(result: state.result));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _StartDateInput(),
              _StartDateInput(),
              _DoorOpeningInput(),
              SizedBox(
                height: 2.h,
              ),
              const _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartDateInput extends StatelessWidget {
  _StartDateInput();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      child: CustomInputField(
          labelText: "Start Date",
          widget: TextField(
            controller: _textEditingController,
            readOnly: true,
            style: mediumText,
            decoration: InputDecoration(
              hintStyle: mediumText,
              isDense: true,
              hintText: "Select start date",
              contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
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
              //context.read<AddLiftCubit>().startDateChanged(startDate);
            },
          )),
    );
  }
}

class _DoorOpeningInput extends StatelessWidget {
  _DoorOpeningInput();
  final values = ["Automatic", "Manual"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      child: CustomInputField(
        labelText: "Door Opening Type",
        widget: DropdownButtonFormField(
          isExpanded: false,
          value: null,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: black,
          style: mediumText,
          decoration: InputDecoration(
              isDense: true,
              hintText: "Select door opening type",
              hintStyle: mediumText,
              contentPadding: EdgeInsets.zero),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onChanged: (doorOpening) {
            //  context.read<AddLiftCubit>().doorOpeningChanged(doorOpening!);
          },
          items: values.map(
            (value) {
              return DropdownMenuItem<String>(
                value: value.toString(),
                child: Text(
                  value.toString(),
                  style: mediumText.copyWith(color: Colors.black),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterAssignedActivitiesCubit,
        FilterAssignedActivitiesState>(
      builder: (context, state) {
        return Container(
          height: 6.h,
          child: CustomFormButton(
            innerText: 'Submit',
            onPressed: () {
              context
                  .read<FilterAssignedActivitiesCubit>()
                  .filterAndFetchAllAssignedActivities();
            },
          ),
        );
      },
    );
  }
}
