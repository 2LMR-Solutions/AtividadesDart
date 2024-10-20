import 'dart:io';
import 'contato.dart';

class Agenda{
  List<Contato> contatos = [];

  void adicionarContato(Contato contato) {
    if (contatoExistente(contato)) {
      print('Contato ja existe na agenda!');
    } else {
      contatos.add(contato);
      print('Contato adicionado com sucesso!');
    }
  }

  bool contatoExistente(Contato contato) {
    return contatos.any((c) => 
      c.nome.toLowerCase() == contato.nome.toLowerCase()
    );
  }

 Contato? buscarContato(String nome) {
    try {
      return contatos.firstWhere(
        (contato) => contato.nome.toLowerCase() == nome.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
  String? validarNumero() {
    while (true) {
      stdout.write('Digite o telefone (apenas numeros): ');
      String? telefone = stdin.readLineSync();
      if (telefone != null && RegExp(r'^\d+$').hasMatch(telefone)) {
        return telefone;
      } else {
        print('Entrada invalida. O telefone deve conter apenas numeros.');
      }
    }
  }
  void removerContato(String nome){
    Contato? contato = buscarContato(nome);
    if (contato != null){
      contatos.remove(contato);
      print('Contato removido com sucesso!');
    } else {
      print('Contato nao encontrado.');
    }
  }

  void listarContatos(){
    if (contatos.isEmpty){
      print('Nenhum contato na agenda.');
    } else {
      contatos.sort((a,b) => a.nome.compareTo(b.nome));
      print('Lista de contatos: ');
      for (var contato in contatos){
        print(contato);
      }
    }
  }

  void editarContato(String nome){
    Contato? contato = buscarContato(nome);
    if (contato != null){
      print('Editar contato (deixe em branco para manter o valor atual): ');

      stdout.write('Novo nome (${contato.nome}): ');
      String? novoNome = stdin.readLineSync();
      if (novoNome != null && novoNome.isNotEmpty) contato.nome = novoNome;

      stdout.write('Novo telefone (${contato.numeroTelefone}): ');
      String? novoTelefone = validarNumero();
      if (novoTelefone != null) contato.numeroTelefone = novoTelefone;

      stdout.write('Novo email (${contato.email}): ');
      String? novoEmail = stdin.readLineSync();
      if (novoEmail != null && novoEmail.isNotEmpty) contato.email = novoEmail;

      print('Contato atualizado com sucesso!');
    } else {
      print('Contato nao encontrado.');
    }
  }
}