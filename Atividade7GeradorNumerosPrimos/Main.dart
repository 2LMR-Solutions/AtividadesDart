import 'dart:io';
import 'VerificaPrimo.dart'; 

void main() {
  while (true) {
    print("Insira um valor:");
    String? input = stdin.readLineSync();
    if (input != null) {
      try {
        int valor = int.parse(input);

        if (valor < 1) {
          print("Não há números primos até $valor.");
          continue;
        }

        String primos = "1 ";  
        
        for (int num = 2; num <= valor; num++) {
          if (VefPrimo(num)) {
            primos += "$num ";  
          }
        }

        print("A lista de números primos de 1 até $valor: $primos");
      } catch (e) {
        print("Insira apenas valores numéricos!");
      }
    }
  }
}
