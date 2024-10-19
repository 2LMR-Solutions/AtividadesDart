import 'dart:io';

void criarArquivo(File arquivo) {
  arquivo.createSync();
  print('Arquivo criado.');
}
