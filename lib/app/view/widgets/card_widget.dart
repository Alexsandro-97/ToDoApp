import 'package:app_todo/app/controller/task_bloc.dart';
import 'package:app_todo/app/model/task_model.dart';
import 'package:app_todo/app/view/widgets/status_widget.dart';
import 'package:flutter/material.dart';

import '../screens/task_update_screen.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    Key? key,
    required this.size,
    required this.task,
    required this.cubit,
    required this.index,
  }) : super(key: key);

  final Size size;
  final Task task;
  final TaskBloc cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.2,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: task.taCompleta,
                  onChanged: (checked) => {
                    cubit.updateTask(
                      index,
                      taCompleta: checked ?? false,
                    ),
                  },
                ),
                const SizedBox(width: 5),
                Text(
                  task.titulo,
                  style: const TextStyle(
                    color: Color(0xFF494655),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTaskScreen(index: index),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Excluir'),
                      content:
                          const Text('Deseja realmente excluir esta tarefa?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Não'),
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.removeTask(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Task removida com sucesso!'),
                              ),
                            );
                            Navigator.pop(context, 'Sim');
                          },
                          child: const Text('Sim'),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(task.descricao),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.schedule, size: 16),
                const SizedBox(width: 5),
                Text(
                  '${task.criadoEm.day}/${task.criadoEm.month}/${task.criadoEm.year}',
                ),
                const Spacer(),
                StatusWidget(task: task),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
