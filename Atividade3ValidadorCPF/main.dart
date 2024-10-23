import 'dart:io';

bool validarCPF(String cpf) {
  //remover caracteres especiais
  cpf = cpf.replaceAll('.', '').replaceAll('-', '');

  //verificar se o CPF tem 11 dígitos e não são iguais
  if (cpf.length != 11 || RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
    return false;
  }

  //primeiro dígito verificador
  List<int> numeros = cpf.split('').map(int.parse).toList();
  int soma = 0;
  for (int i = 0; i < 9; i++) {
    soma += numeros[i] * (10 - i);
  }
  int primeiroDigitoVerificador = 11 - (soma % 11);
  if (primeiroDigitoVerificador >= 10) {
    primeiroDigitoVerificador = 0;
  }

  //verificando o primeiro digito
  if (primeiroDigitoVerificador != numeros[9]) {
    return false;
  }

  //segundo digito verificador
  soma = 0;
  for (int i = 0; i < 10; i++) {
    soma += numeros[i] * (11 - i);
  }
  int segundoDigitoVerificador = 11 - (soma % 11);
  if (segundoDigitoVerificador >= 10) {
    segundoDigitoVerificador = 0;
  }

  //verificar o segundo dígito
  if (segundoDigitoVerificador != numeros[10]) {
    return false;
  }

  return true;
}

void main() {
  print("\n\nDigite o CPF no formato 000.000.000-00:");
  String? cpf = stdin.readLineSync();

  if (cpf != null && validarCPF(cpf)) {
    print("\x1B[32m\nCPF válido.\n\x1B[0m");
  } else {
    print("\x1B[31m\nCPF inválido.\n\x1B[0m");
  }
}
