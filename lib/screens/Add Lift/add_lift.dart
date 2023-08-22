// ignore_for_file: library_private_types_in_public_api, unused_field, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:neerp/app/bloc/auth_bloc_bloc.dart';
import 'package:neerp/screens/Add%20Lift/cubit/add_lift_cubit.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/components/error_dialog.dart';
import 'package:neerp/utils/components/page_heading.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class AddLiftScreen extends StatelessWidget {
  const AddLiftScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AddLiftScreen());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFf3f8fe),
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => AddLiftCubit(context.read<APIService>()),
          child: const AddLift(),
        ),
      ),
    );
  }
}

class AddLift extends StatelessWidget {
  const AddLift({super.key});

  @override
  Widget build(BuildContext context) {
    final userId =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.id);
    final token =
        context.select((AuthBlocBloc bloc) => bloc.state.customer.token);
    return Builder(builder: (context) {
      context.read<AddLiftCubit>().userIdChanged(userId);
      context.read<AddLiftCubit>().tokenChanged(token!);
      return BlocListener<AddLiftCubit, AddLiftState>(
        listener: (context, state) {
          if (state.status == AddLiftStatus.error) {
            showCupertinoSnackBar(
                context: context, message: state.errorResponse);
          }
        },
        child: CustomScrollView(
          primary: true,
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Add Lift',
                style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
              ),
              alwaysShowMiddle: false,
              middle: Text(
                'Add Lift',
                style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
              ),
              backgroundColor: const Color(0xFFf3f8fe),
              leading: SvgPicture.asset(
                "assets/images/back.svg",
                height: 30.h,
                width: 30.h,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const _SiteNameInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _SiteAddressInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _CustomerNameInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _EmailInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _PhoneInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _NoOfLiftsInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _FloorDesignationInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    _AMCTypeInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    _LiftTypeInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    _StartDateInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    _EndDateInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _NoOfServicesInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    const _AmountInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    _DoorOpeningInput(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _SubmitButton(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class _SiteNameInput extends StatelessWidget {
  const _SiteNameInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Site Name",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.siteName != current.siteName,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter site name",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (siteName) {
              context.read<AddLiftCubit>().siteNameChanged(siteName);
            },
          );
        },
      ),
    );
  }
}

class _SiteAddressInput extends StatelessWidget {
  const _SiteAddressInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Site Address",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.siteAddress != current.siteAddress,
        builder: (context, state) {
          return TextField(
            // obscureText: (widget.obscureText && _obscureText),
            decoration: const InputDecoration(
              hintText: "Enter site address",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (siteAddress) {
              context.read<AddLiftCubit>().siteAddressChanged(siteAddress);
            },
          );
        },
      ),
    );
  }
}

class _CustomerNameInput extends StatelessWidget {
  const _CustomerNameInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Customer Name",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.customerName != current.customerName,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter customer name",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (customerName) {
              context.read<AddLiftCubit>().customerNameChanged(customerName);
            },
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Email",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter email",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (email) {
              context.read<AddLiftCubit>().emailChanged(email);
            },
          );
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Phone no.",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter phone number",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (phone) {
              context.read<AddLiftCubit>().phoneChanged(phone);
            },
          );
        },
      ),
    );
  }
}

class _NoOfLiftsInput extends StatelessWidget {
  const _NoOfLiftsInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "No. of Lifts",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.noOfLifts != current.noOfLifts,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter  no. of lifts",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (noOfLifts) {
              context.read<AddLiftCubit>().noOfLiftsChanged(noOfLifts);
            },
          );
        },
      ),
    );
  }
}

class _FloorDesignationInput extends StatelessWidget {
  const _FloorDesignationInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "No. of Floors",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.floorDesignation != current.floorDesignation,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter no. of floors",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (floorDesignation) {
              context
                  .read<AddLiftCubit>()
                  .floorDesignationChanged(floorDesignation);
            },
          );
        },
      ),
    );
  }
}

class _AMCTypeInput extends StatelessWidget {
  _AMCTypeInput();
  final values = ["Comprehensive", "Non-Comprehensive", "Semi-Comprehensive"];
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "AMC Type",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.amcType != current.amcType,
        builder: (context, state) {
          return /* TextField(
            decoration: const InputDecoration(
              hintText: "Enter  no. of lifts",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (noOfLifts) {
              context.read<AddLiftCubit>().noOfLiftsChanged(noOfLifts);
            },
          ); */

              DropdownButtonFormField(
            isExpanded: false,
            value: null,
            iconDisabledColor: Colors.grey,
            iconEnabledColor: black,
            style: mediumText,
            decoration: const InputDecoration(
              hintText: "Select AMC type",
              contentPadding: EdgeInsets.zero,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            onChanged: (amcType) {
              context.read<AddLiftCubit>().amcTypeChanged(amcType!);
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
          );
        },
      ),
    );
  }
}

class _LiftTypeInput extends StatelessWidget {
  _LiftTypeInput();
  final values = [
    "Passenger Lift",
    "Goods Lift",
    "Capsule Lift",
    "Dumbwaiter Lift",
    "Hospital Lift"
  ];
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Lift Type",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.liftType != current.liftType,
        builder: (context, state) {
          return /* TextField(
            decoration: const InputDecoration(
              hintText: "Enter  no. of lifts",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (noOfLifts) {
              context.read<AddLiftCubit>().noOfLiftsChanged(noOfLifts);
            },
          ); */
              DropdownButtonFormField(
            isExpanded: false,
            value: null,
            iconDisabledColor: Colors.grey,
            iconEnabledColor: black,
            style: mediumText,
            decoration: const InputDecoration(
              hintText: "Select Lift type",
              contentPadding: EdgeInsets.zero,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            onChanged: (liftType) {
              context.read<AddLiftCubit>().liftTypeChanged(liftType!);
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
          );
        },
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
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.startDate != current.startDate,
        builder: (context, state) {
          return TextField(
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
                  ..selection = TextSelection.fromPosition(TextPosition(
                      offset: _textEditingController.text.length,
                      affinity: TextAffinity.upstream));
              } else {}
            },
            onChanged: (startDate) {
              context.read<AddLiftCubit>().startDateChanged(startDate);
            },
          );
        },
      ),
    );
  }
}

class _EndDateInput extends StatelessWidget {
  _EndDateInput();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "End Date",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.endDate != current.endDate,
        builder: (context, state) {
          return TextField(
            controller: _textEditingController,
            readOnly: true,
            decoration: const InputDecoration(
              hintText: "Select end date",
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
                  ..selection = TextSelection.fromPosition(TextPosition(
                      offset: _textEditingController.text.length,
                      affinity: TextAffinity.upstream));
              } else {}
            },
            onChanged: (endDate) {
              context.read<AddLiftCubit>().endDateChanged(endDate);
            },
          );
        },
      ),
    );
  }
}

class _NoOfServicesInput extends StatelessWidget {
  const _NoOfServicesInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "No. of Services",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.noOfServices != current.noOfServices,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter no. of services",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (noOfServices) {
              context.read<AddLiftCubit>().noOfServicesChanged(noOfServices);
            },
          );
        },
      ),
    );
  }
}

class _AmountInput extends StatelessWidget {
  const _AmountInput();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Amount",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) => previous.amount != current.amount,
        builder: (context, state) {
          return TextField(
            decoration: const InputDecoration(
              hintText: "Enter the amount",
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (amount) {
              context.read<AddLiftCubit>().amountChanged(amount);
            },
          );
        },
      ),
    );
  }
}

class _DoorOpeningInput extends StatelessWidget {
  _DoorOpeningInput();
  final values = ["Automatic", "Manual"];
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Door Opening Type",
      widget: BlocBuilder<AddLiftCubit, AddLiftState>(
        buildWhen: (previous, current) =>
            previous.doorOpening != current.doorOpening,
        builder: (context, state) {
          return DropdownButtonFormField(
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
              context.read<AddLiftCubit>().doorOpeningChanged(doorOpening!);
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
          );
        },
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddLiftCubit, AddLiftState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == AddLiftStatus.submitting
            ? const UnconstrainedBox(child: CircularProgressIndicator())
            : CustomFormButton(
                innerText: 'Submit',
                onPressed: () {
                  context.read<AddLiftCubit>().addLiftWithCredentials();
                },
              );
      },
    );
  }
}
