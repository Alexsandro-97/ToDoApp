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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Sua lista está vazia. Adicione uma tarefa!',
                style: TextStyle(
                  color: Color(0xFF494655),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
          ),
        );
      },
    );
  }
}
