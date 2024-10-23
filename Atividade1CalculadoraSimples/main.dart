import 'dart:io';

void calculadora() {
  print("Bem-vindo à calculadora!");
  double resultado = 0.0;
  List<int> opcoes = [1, 2, 3, 4, 5];

  while (true) {
    print("\nOperações:");
    print("1. Adição (+)");
    print("2. Subtração (-)");
    print("3. Multiplicação (*)");
    print("4. Divisão (/)");
    print("5. Sair");

    int? op;
    try {
      print("\nDigite a opção desejada: ");
      op = int.parse(stdin.readLineSync()!);
      if (!opcoes.contains(op)) {
        print("\x1B[31m\n\nERRO! Digite uma opção válida!\x1B[0m");
        continue;
      }
    } catch (e) {
      print("\x1B[31m\n\nERRO! Digite uma opção válida!\x1B[0m");
      continue;
    }

    if (op == 5) {
      print("\nObrigado por usar a calculadora!\n\n");
      break;
    }

    double? num1;
    double? num2;

    while (true) {
      try {
        print("Digite o primeiro número: ");
        num1 = double.parse(stdin.readLineSync()!);
        break;
      } catch (e) {
        print("\x1B[31m\n\nERRO! Digite uma opção válida!\x1B[0m");
      }
    }

    while (true) {
      try {
        print("Digite o segundo número: ");
        num2 = double.parse(stdin.readLineSync()!);
        if (op == 4 && num2 == 0) {
          print("\x1B[31m\n\nERRO! Divisão por zero não permitida!\x1B[0m");
          continue;
        }
        break;
      } catch (e) {
        print("\x1B[31m\n\nERRO! Digite um número válido!\x1B[0m");
      }
    }

    switch (op) {
      case 1:
        resultado = num1 + num2;
        break;
      case 2:
        resultado = num1 - num2;
        break;
      case 3:
        resultado = num1 * num2;
        break;
      case 4:
        resultado = num1 / num2;
        break;
    }

    print("\n\nO resultado é: $resultado");
  }
}

void main() {
  calculadora();
}

//esse exercício foi baseado na calculadora https://github.com/rafaelagonzatto/M-trica-de-Software
//rodando no vs code as mensagens de erro aparecem em cor vermelha
