import 'dart:io';

void lerArquivo(File arquivo) {
    String conteudo = arquivo.readAsStringSync();
    print('Conteúdo do arquivo:\n$conteudo');
}