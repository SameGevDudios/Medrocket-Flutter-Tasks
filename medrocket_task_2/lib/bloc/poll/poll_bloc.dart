import 'package:flutter_bloc/flutter_bloc.dart';
import '../../abstractions/poll_repository.dart';
import '../../abstractions/poll_event.dart';
import '../../data/models/poll.dart';
import 'poll_state.dart';
import 'poll_requested.dart';

class PollBloc extends Bloc<PollEvent, PollState> {
  final PollRepository repository;

  PollBloc({required this.repository}) : super(const PollState.empty()) {
    on<PollRequested>(_onRequested);
  }

  Future<void> _onRequested(
    PollRequested event,
    Emitter<PollState> emit,
  ) async {
    emit(const PollState.inProgress());
    try {
      final Poll poll = await repository.fetchPoll();
      emit(PollState.completed(poll));
    } catch (e) {
      emit(PollState.failure(e.toString()));
    }
  }
}
