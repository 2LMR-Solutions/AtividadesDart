import 'dart:io';
import 'agenda.dart';
import 'contato.dart';

void main() {
  Agenda agenda = Agenda();
  while (true) {
    print('\n--- Agenda de Contatos ---');
    print('1. Adicionar contato');
    print('2. Editar contato');
    print('3. Remover contato');
    print('4. Listar contatos');
    print('5. Sair');
    
    stdout.write('Escolha uma opcao: ');
    String? opcao = stdin.readLineSync();
    
    switch (opcao) {
      case '1':
        stdout.write('Nome: ');
        String? nome = stdin.readLineSync();
        String? telefone = agenda.validarNumero();
        stdout.write('Email: ');
        String? email = stdin.readLineSync();
        if (nome != null && telefone != null && email != null) {
          agenda.adicionarContato(Contato(nome, telefone, email));
        } else {
          print('Entrada invalida.');
        }
        break;

      case '2':
        stdout.write('Nome do contato para editar: ');
        String? nomeParaEditar = stdin.readLineSync();
        if (nomeParaEditar != null) {
          agenda.editarContato(nomeParaEditar);
        }
        break;

      case '3':
        stdout.write('Nome do contato para remover: ');
        String? nomeParaRemover = stdin.readLineSync();
        if (nomeParaRemover != null) {
          agenda.removerContato(nomeParaRemover);
        }
        break;

      case '4':
        agenda.listarContatos();
        break;

      case '5':
        print('Saindo...');
        exit(0);

      default:
        print('Opção invalida. Tente novamente.');
    }
  }
}