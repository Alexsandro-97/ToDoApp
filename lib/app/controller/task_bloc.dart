import 'package:app_todo/app/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Cubit<List<Task>> {
  TaskBloc() : super([]);

  void addTask(String titulo, String descricao) {
    emit([...state, Task(titulo, descricao)]);
  }

  void updateTask(int posicao,
      {String? titulo, String? descricao, bool? taCompleta}) {
    final updatedTask = state[posicao]
        .copy(taCompleta: taCompleta, titulo: titulo, descricao: descricao);
    state[posicao] = updatedTask;
    emit([...state]);
  }

  void removeTask(int posicao) {
    final currentState = [...state];
    currentState.removeAt(posicao);
    emit([...currentState]);
  }
}
