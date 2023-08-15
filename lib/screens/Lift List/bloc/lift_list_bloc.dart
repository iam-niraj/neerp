import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:neerp/models/lift_list/lift_request_model.dart';
import 'package:neerp/models/lift_list/lift_response_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';
import 'package:stream_transform/stream_transform.dart';

part 'lift_list_event.dart';
part 'lift_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class LiftListBloc extends Bloc<LiftListEvent, LiftListState> {
  final APIService _apiService;
  LiftListBloc({
    required APIService apiService,
  })  : _apiService = apiService,
        super(const LiftListState()) {
    on<LiftsFetched>(_onLiftListFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onLiftListFetched(
      LiftsFetched event, Emitter<LiftListState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == LiftFetchedStatus.initial) {
        final lifts = await _apiService.getLiftList(
            LiftListRequestModel(userId: event.id, token: event.token));
        return emit(
          state.copyWith(
            status: LiftFetchedStatus.success,
            result: lifts.result,
            hasReachedMax: false,
          ),
        );
      }
      /* final lifts = await _fetchPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
            ); */
    } catch (_) {
      emit(state.copyWith(status: LiftFetchedStatus.failure));
    }
  }
}
