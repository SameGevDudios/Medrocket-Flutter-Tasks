import 'dart:async';
import '../../abstractions/poll_repository.dart';
import '../models/poll.dart';

class PollRepositoryMock implements PollRepository{
  final Duration delay = const Duration(seconds: 2);
  final int percent;

  PollRepositoryMock({required this.percent});

  @override
  Future<Poll> fetchPoll() async {
    await Future.delayed(delay);
    return Poll(percent: percent.clamp(0, 100));
  }
}