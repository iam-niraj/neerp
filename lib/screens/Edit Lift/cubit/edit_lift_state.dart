part of 'edit_lift_cubit.dart';

enum EditLiftStatus { initial, submitting, success, error }

class EditLiftState extends Equatable {
  const EditLiftState(
      {required this.siteName,
      required this.siteAddress,
      required this.customerName,
      required this.email,
      required this.phone,
      required this.noOfLifts,
      required this.floorDesignation,
      required this.amcType,
      required this.custId,
      required this.amount,
      required this.userId,
      required this.token,
      required this.liftType,
      required this.status,
      required this.errorResponse});

  final String siteName;
  final String siteAddress;
  final String customerName;
  final String email;
  final String phone;
  final String noOfLifts;
  final String floorDesignation;
  final String amcType;
  final String custId;
  final String amount;
  final String userId;
  final String token;
  final String liftType;
  final String errorResponse;
  final EditLiftStatus status;

  factory EditLiftState.initial() {
    return const EditLiftState(
        siteName: '',
        siteAddress: '',
        customerName: '',
        email: '',
        phone: '',
        noOfLifts: '',
        floorDesignation: '',
        amcType: '',
        custId: '',
        amount: '',
        userId: '',
        token: '',
        liftType: '',
        errorResponse: '',
        status: EditLiftStatus.initial);
  }

  EditLiftState copyWith(
      {String? siteName,
      String? siteAddress,
      String? customerName,
      String? email,
      String? phone,
      String? noOfLifts,
      String? floorDesignation,
      String? amcType,
      String? custId,
      String? amount,
      String? userId,
      String? token,
      String? liftType,
      String? errorResponse,
      EditLiftStatus? status}) {
    return EditLiftState(
        siteName: siteName ?? this.siteName,
        siteAddress: siteAddress ?? this.siteAddress,
        customerName: customerName ?? this.customerName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        noOfLifts: noOfLifts ?? this.noOfLifts,
        floorDesignation: floorDesignation ?? this.floorDesignation,
        amcType: amcType ?? this.amcType,
        custId: custId ?? this.custId,
        amount: amount ?? this.amount,
        userId: userId ?? this.userId,
        token: token ?? this.token,
        liftType: liftType ?? this.liftType,
        status: status ?? this.status,
        errorResponse: errorResponse ?? this.errorResponse);
  }

  @override
  List<Object> get props => [
        siteName,
        siteAddress,
        customerName,
        email,
        phone,
        noOfLifts,
        floorDesignation,
        amcType,
        custId,
        amount,
        userId,
        token,
        liftType,
        errorResponse,
        status
      ];
}
