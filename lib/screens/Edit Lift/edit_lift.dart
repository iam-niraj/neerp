// ignore_for_file: library_private_types_in_public_api, unused_field, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neerp/models/lift_list/lift_response_model.dart';
import 'package:neerp/screens/Edit%20Lift/cubit/edit_lift_cubit.dart';
import 'package:neerp/utils/colors.dart';
import 'package:neerp/utils/components/custom_form_button.dart';
import 'package:neerp/utils/components/custom_input_field.dart';
import 'package:neerp/utils/components/custom_snackbar.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:neerp/utils/constants.dart';

class EditLiftScreen extends StatelessWidget {
  const EditLiftScreen({required this.lift, super.key});

  final Result lift;

  static Route<void> route(lift) {
    return CupertinoPageRoute<void>(builder: (_) => EditLiftScreen(lift: lift));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: SafeArea(
        top: false,
        child: BlocProvider(
          create: (context) => EditLiftCubit(context.read<APIService>())
            ..siteNameChanged(lift.siteName!)
            ..siteAddressChanged(lift.siteAddress!)
            ..customerNameChanged(lift.customerName!)
            ..emailChanged(lift.email!)
            ..phoneChanged(lift.phone!)
            ..noOfLiftsChanged(lift.noOfLifts!)
            ..floorDesignationChanged(lift.floorDesignation!)
            ..amcTypeChanged(lift.amcType!)
            ..liftTypeChanged(lift.liftType!)
            ..amountChanged(lift.amount!)
            ..custIdChanged(lift.custId!)
            ..userIdChanged(lift.userId!)
            ..tokenChanged("123456"),
          child: EditLift(lift: lift),
        ),
      ),
    );
  }
}

class EditLift extends StatelessWidget {
  const EditLift({super.key, required this.lift});

  final Result lift;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocListener<EditLiftCubit, EditLiftState>(
        listener: (context, state) {
          if (state.status == EditLiftStatus.error) {
            showCupertinoSnackBar(
                context: context, message: state.errorResponse);
          } else if (state.status == EditLiftStatus.success) {
            Navigator.pop(context);
          }
        },
        child: CustomScrollView(
          primary: true,
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Edit Lift',
                style: bigText.copyWith(fontFamily: "Poppins", fontSize: 40.sp),
              ),
              alwaysShowMiddle: false,
              middle: Text(
                'Edit Lift',
                style: bigText.copyWith(fontFamily: "Poppins", fontSize: 20.sp),
              ),
              /* SvgPicture.asset(
                "assets/images/back.svg",
                height: 30.h,
                width: 30.h,
              ), */
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    _SiteNameInput(hintText: lift.siteName!),
                    const SizedBox(
                      height: 16,
                    ),
                    _SiteAddressInput(hintText: lift.siteAddress!),
                    const SizedBox(
                      height: 16,
                    ),
                    _CustomerNameInput(hintText: lift.customerName!),
                    const SizedBox(
                      height: 16,
                    ),
                    _EmailInput(hintText: lift.email!),
                    const SizedBox(
                      height: 16,
                    ),
                    _PhoneInput(hintText: lift.phone!),
                    const SizedBox(
                      height: 16,
                    ),
                    _NoOfLiftsInput(hintText: lift.noOfLifts!),
                    const SizedBox(
                      height: 16,
                    ),
                    _FloorDesignationInput(hintText: lift.floorDesignation!),
                    const SizedBox(
                      height: 16,
                    ),
                    _AMCTypeInput(hintText: lift.amcType!),
                    const SizedBox(
                      height: 16,
                    ),
                    _LiftTypeInput(hintText: lift.liftType!),
                    const SizedBox(
                      height: 16,
                    ),
                    _AmountInput(hintText: lift.amount!),
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
  const _SiteNameInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Site Name",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) => previous.siteName != current.siteName,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (siteName) {
              context.read<EditLiftCubit>().siteNameChanged(siteName);
            },
          );
        },
      ),
    );
  }
}

class _SiteAddressInput extends StatelessWidget {
  const _SiteAddressInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Site Address",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) =>
            previous.siteAddress != current.siteAddress,
        builder: (context, state) {
          return TextField(
            // obscureText: (widget.obscureText && _obscureText),
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (siteAddress) {
              context.read<EditLiftCubit>().siteAddressChanged(siteAddress);
            },
          );
        },
      ),
    );
  }
}

class _CustomerNameInput extends StatelessWidget {
  const _CustomerNameInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Customer Name",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) =>
            previous.customerName != current.customerName,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (customerName) {
              context.read<EditLiftCubit>().customerNameChanged(customerName);
            },
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Email",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (email) {
              context.read<EditLiftCubit>().emailChanged(email);
            },
          );
        },
      ),
    );
  }
}

class _PhoneInput extends StatelessWidget {
  const _PhoneInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Phone no.",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) => previous.phone != current.phone,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (phone) {
              context.read<EditLiftCubit>().phoneChanged(phone);
            },
          );
        },
      ),
    );
  }
}

class _NoOfLiftsInput extends StatelessWidget {
  const _NoOfLiftsInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "No. of Lifts",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) =>
            previous.noOfLifts != current.noOfLifts,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (noOfLifts) {
              context.read<EditLiftCubit>().noOfLiftsChanged(noOfLifts);
            },
          );
        },
      ),
    );
  }
}

class _FloorDesignationInput extends StatelessWidget {
  const _FloorDesignationInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "No. of Floors",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) =>
            previous.floorDesignation != current.floorDesignation,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (floorDesignation) {
              context
                  .read<EditLiftCubit>()
                  .floorDesignationChanged(floorDesignation);
            },
          );
        },
      ),
    );
  }
}

class _AMCTypeInput extends StatelessWidget {
  _AMCTypeInput({required this.hintText});
  final String hintText;
  final values = ["Comprehensive", "Non-Comprehensive", "Semi-Comprehensive"];
  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "AMC Type",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) => previous.amcType != current.amcType,
        builder: (context, state) {
          return DropdownButtonFormField(
            isExpanded: false,
            value: null,
            iconDisabledColor: Colors.grey,
            iconEnabledColor: black,
            style: mediumText,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            onChanged: (amcType) {
              context.read<EditLiftCubit>().amcTypeChanged(amcType!);
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
  _LiftTypeInput({required this.hintText});
  final String hintText;
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
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) => previous.liftType != current.liftType,
        builder: (context, state) {
          return DropdownButtonFormField(
            isExpanded: false,
            value: null,
            iconDisabledColor: Colors.grey,
            iconEnabledColor: black,
            style: mediumText,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            onChanged: (liftType) {
              context.read<EditLiftCubit>().liftTypeChanged(liftType!);
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

class _AmountInput extends StatelessWidget {
  const _AmountInput({required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      labelText: "Amount",
      widget: BlocBuilder<EditLiftCubit, EditLiftState>(
        buildWhen: (previous, current) => previous.amount != current.amount,
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: (amount) {
              context.read<EditLiftCubit>().amountChanged(amount);
            },
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
    return BlocBuilder<EditLiftCubit, EditLiftState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == EditLiftStatus.submitting
            ? const UnconstrainedBox(child: CircularProgressIndicator())
            : CustomFormButton(
                innerText: 'Submit',
                onPressed: () {
                  context.read<EditLiftCubit>().editLiftWithCredentials();
                },
              );
      },
    );
  }
}
