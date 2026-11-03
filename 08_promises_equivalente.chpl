use Time;

writeln("Inicio do programa");

var resultado: sync int;

sync {
  begin {
    writeln("Tarefa: iniciando calculo...");
    sleep(2);

    resultado.writeEF(50);
    writeln("Tarefa: calculo finalizado");
  }

  writeln("Principal: executando outras instrucoes");

  writeln("Principal: aguardando resultado...");
  var valor = resultado.readFE();

  writeln("Principal: resultado recebido = ", valor);
}

writeln("Fim do programa");
