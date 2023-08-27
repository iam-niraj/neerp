part of 'service_details_bloc.dart';

class ServiceDetailsEvent extends Equatable {
  const ServiceDetailsEvent();

  @override
  List<Object> get props => [];
}

class ServicesFetched extends ServiceDetailsEvent {
  final String id;
  final String token;
  final String leadId;

  const ServicesFetched(
      {required this.id, required this.token, required this.leadId});

  @override
  List<Object> get props => [id, token, leadId];
}
