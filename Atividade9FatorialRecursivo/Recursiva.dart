int calcularFatorial(int numero) {
  if (numero <= 1) {
    return 1; 
  } else {
    return numero * calcularFatorial(numero - 1); 
  }
}