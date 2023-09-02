import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neerp/screens/Pending%20Activity/cubit/pending_activities_cubit.dart';
import 'package:neerp/screens/Pending%20Activity/filter_form.dart/cubit/filter_pending_activities_cubit.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final double max;
  final double min;

  HeaderDelegate({required this.max, required this.min});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocProvider(
      create: (context) =>
          FilterPendingActivitiesCubit(context.read<APIService>()),
      child: FormView(),
    );

    /* Container(height: 48, color: CupertinoColors.black); */
  }

  @override
  double get maxExtent => max;

  @override
  double get minExtent => max;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class FormView extends StatelessWidget {
  const FormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilterPendingActivitiesCubit,
        FilterPendingActivitiesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
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
