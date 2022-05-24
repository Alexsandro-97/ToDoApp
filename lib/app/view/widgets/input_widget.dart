import 'package:app_todo/app/controller/task_bloc.dart';
import 'package:app_todo/app/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key, this.position}) : super(key: key);

  final int? position;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.position != null) {
      final cubit = context.read<TaskBloc>();
      tituloController.text = cubit.state[widget.position!].titulo;
      descricaoController.text = cubit.state[widget.position!].descricao;
    }
  }

  @override
  void dispose() {
    tituloController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskBloc>();

    return BlocBuilder<TaskBloc, List<Task>>(
      builder: (context, state) {
        const double sizeButton = 50;
        return Column(
          children: [
            const Text(
              'Adicione sua tarefa',
              style: TextStyle(
                color: Color(0xFF494655),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Flexible(
              child: TextField(
                controller: tituloController,
                decoration: const InputDecoration(
                  hintText: 'Título',
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: descricaoController,
                decoration: const InputDecoration(
                  hintText: 'Descrição',
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Container(
                  width: sizeButton,
                  height: sizeButton,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: const Icon(Icons.save, color: Colors.white),
                ),
                onTap: () async {
                  if (widget.position != null) {
                    cubit.updateTask(
                      widget.position!,
                      titulo: tituloController.text,
                      descricao: descricaoController.text,
                    );
                  } else {
                    cubit.addTask(
                        tituloController.text, descricaoController.text);
                  }
                  tituloController.clear();
                  descricaoController.clear();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
