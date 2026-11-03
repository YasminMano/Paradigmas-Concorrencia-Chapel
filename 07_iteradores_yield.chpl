iter gerarNumeros() {
  for i in 1..3 {
    writeln("Iterador: produzindo ", i);
    yield i;
  }
}

writeln("Inicio do programa");

for numero in gerarNumeros() {
  writeln("Consumidor: recebeu ", numero);
}

writeln("Fim do programa");