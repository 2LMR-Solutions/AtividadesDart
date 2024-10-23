import 'dart:io';

double celsiusParaFahrenheit(double celsius) {
  return (celsius * 9/5) + 32;
}

double celsiusParaKelvin(double celsius) {
  return celsius + 273.15;
}

double fahrenheitParaCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5/9;
}

double fahrenheitParaKelvin(double fahrenheit) {
  return (fahrenheit + 459.67) * 5/9;
}

double kelvinParaCelsius(double kelvin) {
  return kelvin - 273.15;
}

double kelvinParaFahrenheit(double kelvin) {
  return (kelvin * 9/5) - 459.67;
}

void main() {
  print("\n\nBem vindo ao Conversor de Temperatura");

  // Entrada de temperatura
  print("\nDigite a temperatura: ");
  double? temperatura = double.tryParse(stdin.readLineSync()!);
  
  if (temperatura == null) {
    print("\x1B[31m\n\nErro: Entrada inválida!\x1B[0m");
    return;
  }

  
  print("\nEscolha a unidade inicial:");
  print("1. Celsius");
  print("2. Fahrenheit");
  print("3. Kelvin");

  int? opcao = int.tryParse(stdin.readLineSync()!);

  if (opcao == null || opcao < 1 || opcao > 3) {
    print("\x1B[31m\n\nErro: Opção inválida!\x1B[0m");
    return;
  }

  switch (opcao) {
    case 1:
      print("\nTemperatura em Fahrenheit: ${celsiusParaFahrenheit(temperatura)} °F");
      print("\nTemperatura em Kelvin: ${celsiusParaKelvin(temperatura)} K\n\n");
      break;
    case 2:
      print("\nTemperatura em Celsius: ${fahrenheitParaCelsius(temperatura)} °C");
      print("\nTemperatura em Kelvin: ${fahrenheitParaKelvin(temperatura)} K\n\n");
      break;
    case 3:
      print("\nTemperatura em Celsius: ${kelvinParaCelsius(temperatura)} °C");
      print("\nTemperatura em Fahrenheit: ${kelvinParaFahrenheit(temperatura)} °F \n\n");
      break;
  }
}
