use Futures;
use Time;

proc calcular(x: int): int {
  sleep(2);
  return x * 2;
}

writeln("Inicio do programa");

const futuro = async(calcular, 25);

writeln("Programa principal continua");

const resultado = futuro.get();

writeln("Resultado recebido: ", resultado);
writeln("Fim do programa");