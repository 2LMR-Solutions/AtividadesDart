import 'dart:io';
import 'gerenciadorArquivo.dart';

void main() async {
  File texto = File('texto.txt');
  gerenciadorArquivo(texto); 
}
