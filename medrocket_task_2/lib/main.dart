import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/poll_repository_mock.dart';
import 'bloc/poll/poll_bloc.dart';
import 'ui_pages/poll_page.dart';

void main(){
  final mockRepository = PollRepositoryMock(percent: 67);

  runApp(
    RepositoryProvider.value(
      value: mockRepository,
      child: BlocProvider(
        create: (context) => PollBloc(repository: mockRepository),
        child: const PollApp(),
      )
    )
  );
}

class PollApp extends StatelessWidget {
  const PollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мок опросник',
      home: const PollPage()
    );
  }
}
