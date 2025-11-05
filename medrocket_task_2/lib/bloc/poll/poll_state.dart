import '../../data/models/poll.dart';
import 'poll_state_type.dart';

class PollState {
  final PollStateType type;
  final Poll? poll;
  final String? message;

  const PollState._({
    required this.type,
    this.poll,
    this.message
  });

  const PollState.empty()
    : this._(type: PollStateType.initial);
  const PollState.inProgress()
    : this._(type: PollStateType.loading);
  const PollState.completed(Poll poll)
    : this._(type : PollStateType.success, poll: poll);
  const PollState.failure(String message)
    : this._(type: PollStateType.failure, message: message);
}