import 'dart:io';
import 'escreverTexto.dart';
import 'criarArquivo.dart';
import 'lerArquivo.dart';

void gerenciadorArquivo(File arquivo){
  if (arquivo.existsSync()) {
    lerArquivo(arquivo);
    print('O que você gostaria de fazer? Escolha 1 ou 2:');
    print('1. Adicionar mais texto');
    print('2. Começar um novo texto');
    String? opcao = stdin.readLineSync();

    if (opcao == '1') {
      escreverTexto(arquivo);
    } else if (opcao == '2') {
      arquivo.writeAsStringSync('');
      print('O arquivo foi limpo. Escreva o novo texto: ');
      escreverTexto(arquivo);
    } else {
      print('Opção inválida.');
    }
    lerArquivo(arquivo);
  } else {
    criarArquivo(arquivo);
    escreverTexto(arquivo);
    lerArquivo(arquivo);
  }
}
