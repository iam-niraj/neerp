import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/models/edit_lift/edit_lift_request_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

part 'edit_lift_state.dart';

class EditLiftCubit extends Cubit<EditLiftState> {
  final APIService _apiService;
  EditLiftCubit(this._apiService) : super(EditLiftState.initial());

  void siteNameChanged(String value) {
    emit(state.copyWith(siteName: value, status: EditLiftStatus.initial));
  }

  void siteAddressChanged(String value) {
    emit(state.copyWith(siteAddress: value, status: EditLiftStatus.initial));
  }

  void customerNameChanged(String value) {
    emit(state.copyWith(customerName: value, status: EditLiftStatus.initial));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: EditLiftStatus.initial));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(phone: value, status: EditLiftStatus.initial));
  }

  void noOfLiftsChanged(String value) {
    emit(state.copyWith(noOfLifts: value, status: EditLiftStatus.initial));
  }

  void floorDesignationChanged(String value) {
    emit(state.copyWith(
        floorDesignation: value, status: EditLiftStatus.initial));
  }

  void amcTypeChanged(String value) {
    emit(state.copyWith(amcType: value, status: EditLiftStatus.initial));
  }

  void custIdChanged(String value) {
    emit(state.copyWith(custId: value, status: EditLiftStatus.initial));
  }

  void amountChanged(String value) {
    emit(state.copyWith(amount: value, status: EditLiftStatus.initial));
  }

  void userIdChanged(String value) {
    emit(state.copyWith(userId: value, status: EditLiftStatus.initial));
  }

  void tokenChanged(String value) {
    emit(state.copyWith(token: value, status: EditLiftStatus.initial));
  }

  void liftTypeChanged(String value) {
    emit(state.copyWith(liftType: value, status: EditLiftStatus.initial));
  }

  Future<void> editLiftWithCredentials() async {
    if (state.status == EditLiftStatus.submitting) return;
    emit(state.copyWith(status: EditLiftStatus.submitting));
    try {
      var result = await _apiService.editLift(EditLiftRequestModel(
        siteName: state.siteName,
        siteAddress: state.siteAddress,
        customerName: state.customerName,
        email: state.email,
        phone: state.phone,
        noOfLifts: state.noOfLifts,
        floorDesignation: state.floorDesignation,
        amcType: state.amcType,
        custId: state.custId,
        amount: state.amount,
        userId: state.userId,
        token: state.token,
        liftType: state.liftType,
      ));

      result.fold(
          (l) => emit(state.copyWith(status: EditLiftStatus.success)),
          (r) => emit(state.copyWith(
              status: EditLiftStatus.error, errorResponse: r.errorMsg)));
    } catch (_) {}
  }
}
