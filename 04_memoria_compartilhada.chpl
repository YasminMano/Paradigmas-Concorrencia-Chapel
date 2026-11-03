var contador = 0;

coforall i in 1..10000 with (ref contador) {
  contador += 1;
}

writeln("Valor esperado: 10000");
writeln("Valor obtido: ", contador);
