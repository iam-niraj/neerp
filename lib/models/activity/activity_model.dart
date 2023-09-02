import 'package:equatable/equatable.dart';

class ActivityModel extends Equatable {
  final String activityNo,
      activityDate,
      customerName,
      customerEmail,
      customerPhone;

  const ActivityModel(
      {required this.activityNo,
      required this.activityDate,
      required this.customerName,
      required this.customerEmail,
      required this.customerPhone});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [activityNo, activityDate, customerName, customerEmail, customerPhone];
}
