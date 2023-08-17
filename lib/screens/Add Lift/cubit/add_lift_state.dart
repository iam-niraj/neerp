part of 'add_lift_cubit.dart';

enum AddLiftStatus { initial, submitting, success, error }

class AddLiftState extends Equatable {
  const AddLiftState(
      {required this.siteName,
      required this.siteAddress,
      required this.customerName,
      required this.email,
      required this.phone,
      required this.noOfLifts,
      required this.floorDesignation,
      required this.amcType,
      required this.startDate,
      required this.endDate,
      required this.noOfServices,
      required this.amount,
      required this.userId,
      required this.token,
      required this.liftType,
      required this.doorOpening,
      required this.status});

  final String siteName;
  final String siteAddress;
  final String customerName;
  final String email;
  final String phone;
  final String noOfLifts;
  final String floorDesignation;
  final String amcType;
  final String startDate;
  final String endDate;
  final String noOfServices;
  final String amount;
  final String userId;
  final String token;
  final String liftType;
  final String doorOpening;
  final AddLiftStatus status;

  factory AddLiftState.initial() {
    return const AddLiftState(
      siteName: '',
      siteAddress: '',
      customerName: '',
      email: '',
      phone: '',
      noOfLifts: '',
      floorDesignation: '',
      amcType: '',
      startDate: '',
      endDate: '',
      noOfServices: '',
      amount: '',
      userId: '',
      token: '',
      liftType: '',
      doorOpening: '',
      status: AddLiftStatus.initial,
    );
  }

  AddLiftState copyWith({
    String? siteName,
    String? siteAddress,
    String? customerName,
    String? email,
    String? phone,
    String? noOfLifts,
    String? floorDesignation,
    String? amcType,
    String? startDate,
    String? endDate,
    String? noOfServices,
    String? amount,
    String? userId,
    String? token,
    String? liftType,
    String? doorOpening,
    AddLiftStatus? status,
  }) {
    return AddLiftState(
      siteName: siteName ?? this.siteName,
      siteAddress: siteAddress ?? this.siteAddress,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      noOfLifts: noOfLifts ?? this.noOfLifts,
      floorDesignation: floorDesignation ?? this.floorDesignation,
      amcType: amcType ?? this.amcType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      noOfServices: noOfServices ?? this.noOfServices,
      amount: amount ?? this.amount,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      liftType: liftType ?? this.liftType,
      doorOpening: doorOpening ?? this.doorOpening,
      status: status ?? this.status,
    );
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
        startDate,
        endDate,
        noOfServices,
        amount,
        userId,
        token,
        liftType,
        doorOpening,
        status
      ];
}
