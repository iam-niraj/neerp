import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neerp/screens/Pending%20Activity/bloc/pending_activities_bloc.dart';

part 'filter_pending_activities_state.dart';

class FilterPendingActivitiesCubit extends Cubit<FilterPendingActivitiesState> {
  final PendingActivitiesBloc pendingActivitiesBloc;

  FilterPendingActivitiesCubit({required this.pendingActivitiesBloc})
      : super(FilterPendingActivitiesState.initial());

  void startDateChanged(String value) {
    emit(state.copyWith(
        startDate: value, status: FilterPendingActivitiesStatus.initial));
  }

  void endDateChanged(String value) {
    emit(state.copyWith(
        endDate: value, status: FilterPendingActivitiesStatus.initial));
  }

  void filterActivites() {
    print("here");
    pendingActivitiesBloc
        .add(const PendingActivitiesFetched(id: "232", token: "123"));
  }
}
