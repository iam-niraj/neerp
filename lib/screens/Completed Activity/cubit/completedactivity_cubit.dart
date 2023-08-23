import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'completedactivity_state.dart';

class CompletedactivityCubit extends Cubit<CompletedactivityState> {
  CompletedactivityCubit() : super(CompletedactivityInitial());
}
