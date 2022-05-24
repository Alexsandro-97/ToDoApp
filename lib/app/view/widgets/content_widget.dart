import 'package:app_todo/app/controller/task_bloc.dart';
import 'package:app_todo/app/model/task_model.dart';
import 'package:app_todo/app/view/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, List<Task>>(
      builder: (context, state) {
        final cubit = context.read<TaskBloc>();
        return Visibility(
          visible: state.isNotEmpty,
          replacement: const Center(
            child: Text('Sua lista está vazia. Adicione uma tarefa!'),
          ),
          child: ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final task = state[index];
                final size = MediaQuery.of(context).size;
                return CardTask(
                  cubit: cubit,
                  index: index,
                  size: size,
                  task: task,
                );
              }),
        );
      },
    );
  }
}