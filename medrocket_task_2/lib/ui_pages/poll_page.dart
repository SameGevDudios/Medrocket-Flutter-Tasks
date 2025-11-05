import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/poll/poll_bloc.dart';
import '../../bloc/poll/poll_state.dart';
import '../../bloc/poll/poll_requested.dart';
import '../../bloc/poll/poll_state_type.dart';

class PollPage extends StatelessWidget {
  const PollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Опросник',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          )
        ),
      ),
      body: Center(
          child: BlocBuilder<PollBloc, PollState>(
            builder: (context, state) {
              switch(state.type) {
                case PollStateType.initial:
                  context.read<PollBloc>().add(const PollRequested());
                  return const Text('Инициализация...');
                case PollStateType.loading:
                  context.read<PollBloc>().add(const PollRequested());
                  return const Text('Загрузка...');
                case PollStateType.success:
                  final int percent = state.poll!.percent;
                  switch (percent){
                    case 0: return Text('Опросник пустой (0%).');
                    case 100: return Text('Опросник заполнен полностью (100%).');
                    default: return Text('Опросник заполняется ($percent%)');
                  }
                default: return Text('Ошибка: ${state.message}');
              }
            },
          ),
        ),
    );
  }
}