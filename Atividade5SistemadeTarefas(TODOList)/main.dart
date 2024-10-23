import 'dart:io';
import 'gerenciadorTarefas.dart';

void main() {
  GerenciadorTarefas gerenciador = GerenciadorTarefas();
  print("\x1B[2J\x1B[0;0H"); // cls no console antes de começar a rodar o codigo
  while (true) {
    print('\n\n--- Gerenciador de Tarefas ---');
    print('1. Adicionar tarefa');
    print('2. Editar tarefa');
    print('3. Remover tarefa');
    print('4. Listar tarefas');
    print('5. Sair');

    stdout.write('Escolha uma opcao: ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print("\x1B[2J\x1B[0;0H");
        stdout.write('Titulo: ');
        String? titulo = stdin.readLineSync();
        
        stdout.write('Esta concluida? (s/n): ');
        String? concluidaInput = stdin.readLineSync();
        bool concluida = concluidaInput != null && concluidaInput.toLowerCase() == 's';

        if (titulo != null && titulo.isNotEmpty) {
          gerenciador.adicionarTarefa(titulo, concluida);
        } else {
          print('Entrada invalida.');
        }
        break;
        

      case '2':
        print("\x1B[2J\x1B[0;0H");
        stdout.write('Titulo da tarefa para editar: ');
        String? tituloParaEditar = stdin.readLineSync();
        if (tituloParaEditar != null) {
          gerenciador.editarTarefa(tituloParaEditar);
        }
        break;

      case '3':
        print("\x1B[2J\x1B[0;0H");
        stdout.write('Titulo da tarefa para remover: ');
        String? tituloParaRemover = stdin.readLineSync();
        if (tituloParaRemover != null) {
          gerenciador.removerTarefa(tituloParaRemover);
        }
        break;

      case '4':
        print("\x1B[2J\x1B[0;0H");
        gerenciador.listarTarefas();
        break;

      case '5':
        print("\x1B[2J\x1B[0;0H");
        print('Saindo...');
        exit(0);

      default:
        print("\x1B[2J\x1B[0;0H");
        print('Opcao invalida. Tente novamente.');
    }
  }
}