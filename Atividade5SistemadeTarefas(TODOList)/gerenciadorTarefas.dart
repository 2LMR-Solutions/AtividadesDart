import 'dart:io';
import 'tarefa.dart';

class GerenciadorTarefas {
  List<Tarefa> tarefas = [];

  void adicionarTarefa(String titulo, bool concluida) {
    tarefas.add(Tarefa(titulo, concluida: concluida));
    print('Tarefa adicionada com sucesso!');
  }

  Tarefa? buscarTarefa(String titulo) {
    try {
      return tarefas.firstWhere(
        (tarefa) => tarefa.titulo.toLowerCase() == titulo.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  void removerTarefa(String titulo) {
    Tarefa? tarefa = buscarTarefa(titulo);
    if (tarefa != null) {
      tarefas.remove(tarefa);
      print('Tarefa removida com sucesso!');
    } else {
      print('Tarefa não encontrada.');
    }
  }

  void listarTarefas() {
    if (tarefas.isEmpty) {
      print('Nenhuma tarefa na lista.');
    } else {
      print('Lista de tarefas:\n\n');
      for (var tarefa in tarefas) {
        print(tarefa);
      }
    }
  }

  void editarTarefa(String titulo) {
    Tarefa? tarefa = buscarTarefa(titulo);
    if (tarefa != null) {
      print('Editar tarefa (deixe em branco para manter o valor atual): ');

      stdout.write('Novo título (${tarefa.titulo}): ');
      String? novoTitulo = stdin.readLineSync();
      if (novoTitulo != null && novoTitulo.isNotEmpty) {
        tarefa.titulo = novoTitulo;
      }

      stdout.write('Esta concluida? (s/n, atual: ${tarefa.concluida ? 'Sim' : 'Não'}): ');
      String? opcaoConcluida = stdin.readLineSync();
      if (opcaoConcluida != null) {
        tarefa.concluida = opcaoConcluida.toLowerCase() == 's';
      }

      print('Tarefa atualizada com sucesso!');
    } else {
      print('Tarefa não encontrada.');
    }
  }
}
