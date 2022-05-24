import 'package:app_todo/app/controller/task_bloc.dart';
import 'package:app_todo/app/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgerCustom extends StatelessWidget {
  const BadgerCustom({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, List<Task>>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.topRight,
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text('${state.length}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white)),
          ),
        );
      },
    );
  }
}
