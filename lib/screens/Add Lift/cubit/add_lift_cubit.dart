import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/add_lift/add_lift_request_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'add_lift_state.dart';

class AddLiftCubit extends Cubit<AddLiftState> {
  final APIService _apiService;
  AddLiftCubit(this._apiService) : super(AddLiftState.initial());

  void siteNameChanged(String value) {
    emit(state.copyWith(siteName: value, status: AddLiftStatus.initial));
  }

  void siteAddressChanged(String value) {
    emit(state.copyWith(siteAddress: value, status: AddLiftStatus.initial));
  }

  void customerNameChanged(String value) {
    emit(state.copyWith(customerName: value, status: AddLiftStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: AddLiftStatus.initial));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(phone: value, status: AddLiftStatus.initial));
  }

  void noOfLiftsChanged(String value) {
    emit(state.copyWith(noOfLifts: value, status: AddLiftStatus.initial));
  }

  void floorDesignationChanged(String value) {
    emit(
        state.copyWith(floorDesignation: value, status: AddLiftStatus.initial));
  }

  void amcTypeChanged(String value) {
    emit(state.copyWith(amcType: value, status: AddLiftStatus.initial));
  }

  void startDateChanged(String value) {
    emit(state.copyWith(startDate: value, status: AddLiftStatus.initial));
  }

  void endDateChanged(String value) {
    emit(state.copyWith(endDate: value, status: AddLiftStatus.initial));
  }

  void noOfServicesChanged(String value) {
    emit(state.copyWith(noOfServices: value, status: AddLiftStatus.initial));
  }

  void amountChanged(String value) {
    emit(state.copyWith(amount: value, status: AddLiftStatus.initial));
  }

  void userIdChanged(String value) {
    emit(state.copyWith(userId: value, status: AddLiftStatus.initial));
  }

  void tokenChanged(String value) {
    emit(state.copyWith(token: value, status: AddLiftStatus.initial));
  }

  void liftTypeChanged(String value) {
    emit(state.copyWith(liftType: value, status: AddLiftStatus.initial));
  }

  void doorOpeningChanged(String value) {
    emit(state.copyWith(doorOpening: value, status: AddLiftStatus.initial));
  }

  Future<void> addLiftWithCredentials() async {
    if (state.status == AddLiftStatus.submitting) return;
    emit(state.copyWith(status: AddLiftStatus.submitting));
    try {
      var result = await _apiService.addLift(AddLiftRequestModel(
          siteName: state.siteName,
          siteAddress: state.siteAddress,
          customerName: state.customerName,
          email: state.email,
          phone: state.phone,
          noOfLifts: state.noOfLifts,
          floorDesignation: state.floorDesignation,
          amcType: state.amcType,
          startDate: state.startDate,
          endDate: state.endDate,
          noOfServices: state.noOfServices,
          amount: state.amount,
          userId: state.userId,
          token: state.token,
          liftType: state.liftType,
          doorOpening: state.doorOpening));
      result.fold(
          (l) => emit(state.copyWith(status: AddLiftStatus.success)),
          (r) => emit(state.copyWith(
              status: AddLiftStatus.error, errorResponse: r.errorMsg)));
    } catch (_) {}
  }
}
