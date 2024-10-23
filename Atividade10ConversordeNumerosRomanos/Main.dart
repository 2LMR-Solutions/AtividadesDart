import 'dart:io';

String inteiroParaRomano(int num) {
  List<Map<String, dynamic>> valores = [
    {'valor': 1000, 'romano': 'M'},
    {'valor': 900, 'romano': 'CM'},
    {'valor': 500, 'romano': 'D'},
    {'valor': 400, 'romano': 'CD'},
    {'valor': 100, 'romano': 'C'},
    {'valor': 90, 'romano': 'XC'},
    {'valor': 50, 'romano': 'L'},
    {'valor': 40, 'romano': 'XL'},
    {'valor': 10, 'romano': 'X'},
    {'valor': 9, 'romano': 'IX'},
    {'valor': 5, 'romano': 'V'},
    {'valor': 4, 'romano': 'IV'},
    {'valor': 1, 'romano': 'I'}
  ];

  String resultado = '';
  for (var item in valores) {
    int valor = item['valor'] as int;
    String romano = item['romano'] as String;

    while (num >= valor) {
      resultado += romano;
      num -= valor;
    }
  }
  return resultado;
}

int romanoParaInteiro(String romano) {
  Map<String, int> valores = {
    'M': 1000, 'CM': 900, 'D': 500, 'CD': 400,
    'C': 100, 'XC': 90, 'L': 50, 'XL': 40,
    'X': 10, 'IX': 9, 'V': 5, 'IV': 4, 'I': 1
  };

  int resultado = 0;
  int i = 0;

  while (i < romano.length) {
    if (i + 1 < romano.length && valores.containsKey(romano.substring(i, i + 2))) {
      resultado += valores[romano.substring(i, i + 2)]!;
      i += 2;
    } 
    else if (valores.containsKey(romano[i])) {
      resultado += valores[romano[i]]!;
      i += 1;
    } 
    else {
      print("Entrada inválida: '$romano'. Use apenas caracteres romanos válidos.");
      return -1;
    }
  }
  return resultado;
}

void main() {
  while (true) {
    print("Escolha uma operação:");
    print("1: Converter inteiro para romano");
    print("2: Converter romano para inteiro");
    print("0: Sair");

    String? escolha = stdin.readLineSync();

    switch (escolha) {
      case '1':
        print("Digite um número inteiro:");
        String? input = stdin.readLineSync();
        if (input != null && int.tryParse(input) != null) {
          int num = int.parse(input);
          print("O número romano é: ${inteiroParaRomano(num)}");
        } else {
          print("Entrada inválida.");
        }
        break;

      case '2':
        print("Digite um número romano:");
        String? romanoInput = stdin.readLineSync();
        if (romanoInput != null && romanoInput.isNotEmpty) {
          int resultado = romanoParaInteiro(romanoInput);
          if (resultado != -1) {
            print("O número inteiro é: $resultado");
          }
        } else {
          print("Entrada inválida.");
        }
        break;

      case '0':
        print("Saindo...");
        return; // Encerra o programa

      default:
        print("Opção inválida. Tente novamente.");
        break;
    }

    print(""); // Linha em branco para separação
  }
}
