var contador: atomic int = 0;

coforall i in 1..10000 {
  contador.add(1);
}

writeln("Valor esperado: 10000");
writeln("Valor obtido: ", contador.read());
