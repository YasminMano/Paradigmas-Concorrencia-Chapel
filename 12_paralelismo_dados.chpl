var numeros: [1..10] int;

writeln("Inicio do processamento paralelo");

forall i in 1..10 with (ref numeros) {
  numeros[i] = i * i;
}

writeln("Resultados:");

for i in 1..10 {
  writeln(i, " ao quadrado = ", numeros[i]);
}

writeln("Processamento finalizado");