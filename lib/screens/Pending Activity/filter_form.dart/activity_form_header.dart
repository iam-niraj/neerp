import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neerp/screens/Pending%20Activity/bloc/pending_activities_bloc.dart';
import 'package:neerp/screens/Pending%20Activity/filter_form.dart/cubit/filter_pending_activities_cubit.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterPendingActivitiesCubit(context.read<APIService>()),
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
        child: BlocListener<FilterPendingActivitiesCubit,
            FilterPendingActivitiesState>(
          listener: (context, state) {
            if (state.status == FilterPendingActivitiesStatus.error) {
              showCupertinoSnackBar(
                  context: context, message: state.errorResponse);
            } else if (state.status == FilterPendingActivitiesStatus.success) {
              context
                  .read<PendingActivitiesBloc>()
                  .add(FilteredPendingActivitiesFetched(result: state.result));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _StartDateInput(),
              const SizedBox(
                height: 16,
              ),
              _StartDateInput(),
              const SizedBox(
                height: 16,
              ),
              _DoorOpeningInput(),
              const SizedBox(
                height: 20,
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
    return CustomInputField(
        labelText: "Start Date",
        widget: TextField(
          controller: _textEditingController,
          readOnly: true,
          decoration: const InputDecoration(
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
            //context.read<AddLiftCubit>().startDateChanged(startDate);
          },
        ));
  }
}

class _DoorOpeningInput extends StatelessWidget {
  _DoorOpeningInput();
  final values = ["Automatic", "Manual"];
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Door Opening Type",
      widget: DropdownButtonFormField(
        isExpanded: false,
        value: null,
        iconDisabledColor: Colors.grey,
        iconEnabledColor: black,
        style: mediumText,
        decoration: const InputDecoration(
          hintText: "Select door opening type",
          contentPadding: EdgeInsets.zero,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterPendingActivitiesCubit,
        FilterPendingActivitiesState>(
      builder: (context, state) {
        return CustomFormButton(
          innerText: 'Submit',
          onPressed: () {
            context
                .read<FilterPendingActivitiesCubit>()
                .filterAndFetchAllPendingActivities();
          },
        );
      },
    );
  }
}
