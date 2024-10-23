import 'dart:math';
import 'dart:io';

void main() {
  Random random = Random();
  
  do {
    int numeroSorteado = random.nextInt(100) + 1; // +1 para não contar o 0 e contar até o 100
    print("\x1B[2J\x1B[0;0H"); // cls no console antes de começar a rodar o codigo
    print("\nSeu objetivo é adivinhar o numero selecionado pelo sistema com a menor quantidade de palpites!\n");

    int contadordePalpites = 0;
    int? numeroDigitadoUsuario;

    while (true) {
      print("Informe um numero positivo entre 1 e 100:");
      String? stringUsuario = stdin.readLineSync();

      if (stringUsuario != null) {
        try {
          numeroDigitadoUsuario = int.parse(stringUsuario);
          
          if (numeroDigitadoUsuario < 1 || numeroDigitadoUsuario > 100) {
            print("\x1B[2J\x1B[0;0H");
            print("Valor invalido, informe um numero positivo entre 1 e 100:");
          } else {
            contadordePalpites++;
            if (numeroDigitadoUsuario > numeroSorteado) {
              print("\x1B[2J\x1B[0;0H");
              print("O numero eh menor.");
            } else if (numeroDigitadoUsuario < numeroSorteado) {
              print("\x1B[2J\x1B[0;0H");
              print("O numero eh maior.");
            } else {
              print("\x1B[2J\x1B[0;0H");
              print('Parabens! Você acertou!');
              print('O numero sorteado foi: $numeroSorteado');
              print('A quantidade de palpites foi: $contadordePalpites');
              break; // quando o usuario acerta sai do loop 
            }
          }
        } catch (e) {
          print("\x1B[2J\x1B[0;0H");
          print("Entrada inválida. Por favor, insira um numero.");
        }
      } else {
        print("\x1B[2J\x1B[0;0H");
        print("Valor invalido, informe um numero positivo entre 1 e 100:");
      }
    }

    print('\nPara jogar novamente tecle enter');
    print('Para sair digite -1');

    String? opcao = stdin.readLineSync();
    if (opcao == '-1') {
      break; 
    }

  } while (true);
}