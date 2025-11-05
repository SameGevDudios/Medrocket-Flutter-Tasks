import '../models/poll.dart';

abstract class PollRepository{
  Future<Poll> fetchPoll();
}