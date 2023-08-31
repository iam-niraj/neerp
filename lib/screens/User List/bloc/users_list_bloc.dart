import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:neerp/models/user_list/user_request_model.dart';
import 'package:neerp/utils/config/services/api_service.dart';

import '../../../models/user_list/user_response_model.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final APIService _apiService;
  UsersListBloc({
    required APIService apiService,
  })  : _apiService = apiService,
        super(const UsersListState()) {
    on<UsersFetched>(_onUsersListFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onUsersListFetched(
      UsersFetched event, Emitter<UsersListState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == UsersFetchedStatus.initial) {
        final users = await _apiService.getUsersList(
            UserListRequestModel(userId: event.id, token: event.token));
        return emit(
          state.copyWith(
            status: UsersFetchedStatus.success,
            result: users.result,
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
      emit(state.copyWith(status: UsersFetchedStatus.failure));
    }
  }
}
