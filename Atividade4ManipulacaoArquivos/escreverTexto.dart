import 'dart:io';
void escreverTexto(File arquivo) {
  print('Digite o texto (para finalizar, pressione Enter duas vezes):');

  StringBuffer buffer = StringBuffer();
  while (true) {
    String? linha = stdin.readLineSync();
    if (linha == null || linha.isEmpty) {
      break;
    }
    buffer.writeln(linha);
  }
  arquivo.writeAsStringSync(buffer.toString(), mode: FileMode.append);
  print('Texto escrito no arquivo.');
}