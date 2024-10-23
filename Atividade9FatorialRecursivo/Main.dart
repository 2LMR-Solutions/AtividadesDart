import 'Recursiva.dart';
import 'dart:io';

void main() {
  while(true){
  print('Digite um número inteiro positivo: ');
  String? input = stdin.readLineSync();
  
  if (input!=null) {
    try {
      int numero = int.parse(input);
      if (numero>20){
        print('O número é muito grande! Reinicie o procedimento');
        break; //Escolhi utilizar desta forma, pois meu entendimento de como utilizar BigINT 
              //não deixou claro como resolver a situação de números maiores que 20
      }
      int fatorial = calcularFatorial(numero);
      print('O fatorial de $numero é $fatorial');
    } catch (e) {
      print('Insira apenas NÚMEROS POSITIVOS!');
    }
  }
  else{
    print('Insira alguma valor númerico');
  }
  }
}